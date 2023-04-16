import 'dart:developer';

import 'package:get/get.dart';
import 'package:osar_pasar/models/active_booking.dart';
import 'package:osar_pasar/repo/active_order.dart';

class ActiveOrderController extends GetxController {
  RxList<ActiveBooking> activeOrderList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    getAllActiveOrder();
    super.onInit();
  }

  getAllActiveOrder() async {
    loading.value = true;
    activeOrderList.clear();
    await ActiveOrderRepo.getAllActiveOrder(
      onSuccess: (notify) {
        loading.value = false;
        activeOrderList.clear();
        log("controlling active  ");
        activeOrderList.addAll(notify);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
