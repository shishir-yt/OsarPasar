import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:osar_pasar/models/notification.dart';
import 'package:osar_pasar/utils/apis.dart';

import '../utils/storage_helper.dart';

class NotificationRepo {
  static Future<void> getAllNotification(
      {required Function(List<NotificationServiceprovider>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(OsarPasarAPI.notificationList);
      http.Response response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": StorageHelper.getToken()!.toString()
        },
      );
      var data = json.decode(response.body);
      print(data);
      if (data['success']) {
        log("on sucess ma aayo");
        onSuccess(notificationListFromJson(data['data']));
        // print(data.toString());
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
