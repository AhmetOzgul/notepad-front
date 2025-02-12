import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:notepad/core/enums/request_methods.dart';
import 'package:notepad/core/util/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteService {
  Future<Map<String, dynamic>?> getNotes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');

      Response? response = await NetworkService.instance.request(
        path: '/notes/get-notes/',
        method: RequestMethod.get,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response != null) {
        return response.data;
      }
      return null;
    } catch (e) {
      log("Get notes request error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> createNote({
    required String title,
    required String content,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');

      Response? response = await NetworkService.instance.request(
        path: '/notes/create/',
        method: RequestMethod.post,
        headers: {
          'Authorization': 'Bearer $token',
        },
        data: {
          'title': title,
          'content': content,
        },
      );

      if (response != null) {
        return response.data;
      }
      return null;
    } catch (e) {
      log("Create note request error: $e");
      return null;
    }
  }
}
