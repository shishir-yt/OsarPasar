import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/item_controller.dart';
import 'package:osar_pasar/controller/service_provider_controller.dart';
import 'package:osar_pasar/models/item_model.dart';
import 'package:osar_pasar/models/service_provider.dart';
import 'package:http/http.dart' as http;
import 'package:osar_pasar/screens/request.dart';
import 'package:osar_pasar/utils/apis.dart';
import 'package:osar_pasar/utils/storage_helper.dart';
import 'package:osar_pasar/widgets/custom_text_field.dart';

import '../utils/colors.dart';
import 'home.dart';

class BookingSummary extends StatelessWidget {
  TextEditingController pickupaddressController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();
  TextEditingController pickupDateController = TextEditingController();
  TextEditingController pickUpTimeController = TextEditingController();

  ServiceProvider serviceProvider;
  BookingSummary({
    super.key,
    required this.from,
    required this.to,
    required this.serviceProvider,
    required this.pickUpTimeController,
    required this.destinationAddressController,
    required this.pickupDateController,
    required this.pickupaddressController,
  });
  String from;
  String to;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  final itemController = Get.find<ItemController>();
  final serviceController = Get.find<ServiceProviderController>();

  @override
  Widget build(BuildContext context) {
    fromController.text = from;
    toController.text = to;
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Booking Summary",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" ${serviceController.selectedServiceProvider.value.name}"),
              // const Text("serviceprovider@gmail.com"),
              const SizedBox(
                height: 27,
              ),
              CustomTextField(
                readOnly: true,
                // initial: "Street No-7, Lakeside, Pokhara",
                controller: fromController,
              ),
              const SizedBox(
                height: 9,
              ),
              const Center(child: Text("To")),
              const SizedBox(
                height: 9,
              ),
              CustomTextField(
                readOnly: true,
                // initial: "Street No-7, Lakeside, Pokhara",
                controller: toController,
              ),
              const SizedBox(
                height: 27,
              ),
              const Text("Item Summary"),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itemController.selectedItems.value.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(e.name ?? ""),
                        ),
                        Text(e.itemCount.toString()),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 46, right: 35, left: 35),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(0xff00183F),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            var test = item_model(
              itemId: itemController.selectedItems.map((element) {
                return ItemId(id: element.id, quantity: element.itemCount);
              }).toList(),
              serviceProviderId: serviceProvider.id,
              pickupAddress: pickupaddressController.text,
              destinationAddress: destinationAddressController.text,
              pickupDate: pickupDateController.text,
              pickupTime: pickUpTimeController.text,
            ).toJson();
            print(test);
            postOrder(
                test: test,
                onSuccess: () {
                  print("error 1234");
                },
                onError: (message) {
                  print("error");
                });

            Get.snackbar(
              'Request Sent Successfully',
              'We will get back to you soon!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );

            Get.offAll(() =>  RequestScreen());
          },
          child: const Text("Send Request"),
        ),
      ),
    );
  }

  static Future<void> postOrder(
      {required var test,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(OsarPasarAPI.bookingSummary);

      var body = json.encode(test);

      http.Response response = await http.post(url,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": StorageHelper.getToken()!.toString()
          },
          body: body);

      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess();
        // print(data.toString());
      } else {
        onError("String message");
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong. Please try again");
    }
  }
}
