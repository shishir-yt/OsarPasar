import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/repo/notification_repo.dart';

import '../models/notification.dart';

class NotificationController extends GetxController {
  RxList<NotificationServiceprovider> notificationList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    getAllNotifications();
    super.onInit();
  }

  getAllNotifications() async {
    loading.value = true;
    await NotificationRepo.getAllNotification(
      onSuccess: (notify) {
        loading.value = false;
        notificationList.clear();
        log("controlling classmate  ");
        notificationList.addAll(notify);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
