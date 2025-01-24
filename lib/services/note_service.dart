import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:notepad/core/enums/request_methods.dart';
import 'package:notepad/core/util/network_service.dart';

class NoteService {
  Future<Map<String, dynamic>?> getNotes() async {
    try {
      Response? response = await NetworkService.instance.request(
        path: '/notes/get-notes/',
        method: RequestMethod.get,
      );
      if (response != null) {
        final responseData = response.data;

        if (response.statusCode == 200 && responseData['status'] == 200) {
          log("Get notes successful");
          return responseData;
        } else {
          log("Get notes failed or unexpected status code: ${response.statusCode}");
          return responseData;
        }
      } else {
        log("Response is null (Get notes)");
        return null;
      }
    } catch (e) {
      log("Get notes request error: $e");
      return null;
    }
  }
}
