import 'dart:developer';
import 'package:get/get.dart';
import 'package:osar_pasar/models/order_request.dart';
import 'package:osar_pasar/repo/order_request_repo.dart';

class OrderRequestController extends GetxController {
  RxList<OrderRequest> orderRequestList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    getAllOrderRequest();
    super.onInit();
  }

  getAllOrderRequest() async {
    loading.value = true;
    await OrderRequestrepo.getAllOrderRequest(
      onSuccess: (orders) {
        loading.value = false;
        log("controlling orders ");
        orderRequestList.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
