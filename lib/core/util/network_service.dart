import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/core/enums/request_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  late final Dio _dio;
  String? _accessToken;

  NetworkService._init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.62:3000/api',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _loadToken();

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (_accessToken == null) {
          await _loadToken();
        }
        options.headers['Authorization'] = 'Bearer $_accessToken';
        log('Request: ${options.method} ${options.path}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        log('Response: ${response.statusCode} - ${response.data}');
        handler.next(response);
      },
      onError: (DioException e, handler) async {
        log('Error: ${e.response?.statusCode} - ${e.message}');
        if (e.response?.statusCode == 401) {
          bool refreshed = await _refreshToken();
          if (refreshed) {
            final opts = e.requestOptions;
            opts.headers['Authorization'] = 'Bearer $_accessToken';
            final retryResponse = await _dio.request(
              opts.path,
              options: Options(
                method: opts.method,
                headers: opts.headers,
              ),
              data: opts.data,
              queryParameters: opts.queryParameters,
            );
            return handler.resolve(retryResponse);
          }
        }

        if (e.response != null) {
          return handler.resolve(e.response!);
        } else {
          return handler.next(e);
        }
      },
    ));
  }

  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken');
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
    _accessToken = token;
  }

  Future<bool> _refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');

    if (refreshToken == null) {
      return false;
    }

    try {
      Response response = await _dio.post('/refresh-token', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        String newAccessToken = response.data['accessToken'];
        await setToken(newAccessToken);
        return true;
      }
      return false;
    } catch (e) {
      log('Token yenileme hatası: $e');
      return false;
    }
  }

  void _handleUnauthorized() {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Oturum süreniz doldu. Lütfen tekrar giriş yapın.'),
          backgroundColor: Colors.red,
        ),
      );
      context.go(NavigationConstants.loginScreen);
    }
  }

  Future<Response?> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method.name.toUpperCase(),
          headers: headers,
        ),
      );

      if (response.statusCode == 401) {
        _handleUnauthorized();
        return null;
      }

      return response;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        _handleUnauthorized();
        return null;
      }
      log('Network Error: $e');
      return null;
    }
  }
}
