import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:notepad/core/enums/request_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._init();
  static NetworkService get instance => _instance;

  Dio? _dio;
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

    _dio!.interceptors.add(InterceptorsWrapper(
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
            final retryResponse = await _dio!.request(
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
      Response response = await _dio!.post('/refresh-token', data: {
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

  Future<Response?> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      switch (method) {
        case RequestMethod.get:
          return await _dio!.get(path, queryParameters: queryParameters);
        case RequestMethod.post:
          return await _dio!.post(path, data: data);
        case RequestMethod.put:
          return await _dio!.put(path, data: data);
        case RequestMethod.delete:
          return await _dio!.delete(path, data: data);
        default:
          throw UnimplementedError('HTTP metodu desteklenmiyor.');
      }
    } catch (e) {
      log('İstek hatası: $e');
      return null;
    }
  }
}
