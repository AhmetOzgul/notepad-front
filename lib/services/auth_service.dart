import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:notepad/core/enums/request_methods.dart';
import 'package:notepad/core/util/network_service.dart';

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      Response? response = await NetworkService.instance.request(
        path: '/users/login',
        method: RequestMethod.post,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response != null && response.statusCode == 200) {
        var responseData = response.data;

        if (responseData['status'] == 200) {
          String token = responseData['data']['token'];
          await NetworkService.instance.setToken(token);

          log("Login successful for user: ${responseData['data']['user']['username']}");
          return responseData;
        } else {
          log("Login failed: ${responseData['message']}");
          return null;
        }
      } else {
        log("Unexpected response code: ${response?.statusCode}");
        return null;
      }
    } catch (e) {
      log("Login request error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> logout() async {
    try {
      Response? response = await NetworkService.instance.request(
        method: RequestMethod.post,
        path: '/users/logout',
      );
      if (response != null && response.statusCode == 200) {
        var responseData = response.data;

        if (responseData['status'] == 200) {
          log("Logout successful");
          return responseData;
        } else {
          log("Logout failed: ${responseData['message']}");
          return null;
        }
      } else {
        log("Unexpected response code: ${response?.statusCode}");
        return null;
      }
    } catch (e) {
      log("Logout request error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(
      String email, String username, String password) async {
    try {
      Response? response = await NetworkService.instance.request(
        path: '/users/register',
        method: RequestMethod.post,
        data: {
          'email': email,
          'username': username,
          'password': password,
        },
      );

      if (response != null && response.statusCode == 200) {
        var responseData = response.data;

        if (responseData['status'] == 200) {
          String token = responseData['data']['token'];
          await NetworkService.instance.setToken(token);

          log("Login successful for user: ${responseData['data']['user']['username']}");
          return responseData;
        } else {
          log("Login failed: ${responseData['message']}");
          return null;
        }
      } else {
        log("Unexpected response code: ${response?.statusCode}");
        return null;
      }
    } catch (e) {
      log("Login request error: $e");
      return null;
    }
  }
}
