import 'dart:developer';

import 'package:get/get.dart';

import '../models/service_provider.dart';
import '../repo/service_provider_repo.dart';

class ServiceProviderController extends GetxController {
  final selectedServiceProvider = ServiceProvider().obs;

  RxList<ServiceProvider> serviceProviders = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    getAllServiceProviders();
    super.onInit();
  }

  getAllServiceProviders() async {
    loading.value = true;
    await ServiceProviderRepo.getServiceProvider(
      onSuccess: (serviceProvider) {
        loading.value = false;

        log("controlling classmate  ");
        serviceProviders.addAll(serviceProvider);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
