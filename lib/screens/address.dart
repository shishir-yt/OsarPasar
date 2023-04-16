import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/item_controller.dart';
import 'package:osar_pasar/models/provinces.dart';
import 'package:osar_pasar/models/service_provider.dart';
import 'package:osar_pasar/utils/storage_helper.dart';
import 'package:osar_pasar/utils/validators.dart';
import 'package:osar_pasar/widgets/custom_text_field.dart';

import '../controller/address_controller.dart';
import '../utils/colors.dart';
import 'booking_summary.dart';

import 'package:http/http.dart' as http;

class AddressPage extends StatefulWidget {
  AddressPage({super.key, required this.serviceProvider});
  ServiceProvider serviceProvider;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var keys = GlobalKey<FormState>();
  final addressController = Get.put(AddressController());
  final itemController = Get.put(ItemController());
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController pickupAddressController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();
  List<NepalProvince> province = [];
  NepalProvince? selectedProvince;
  District? selectedDistrict;
  Cities? selectedCities;
  @override
  void initState() {
    super.initState();
    AddressController().get().then((value) {
      province = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Address",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: keys,
          child: Column(
            children: [
             
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Select date",
                readOnly: true,
                controller: dateController,
                validator: Validators.checkFieldEmpty,
                onTap: () async {
                  DateTime now = DateTime.now();

                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: now,
                    lastDate: DateTime(now.year + 1),
                  ).then((value) {
                    if (value != null) {
                      dateController.text = value.toString().split(" ")[0];
                      setState(() {});
                    }
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Select time",
                validator: Validators.checkFieldEmpty,
                readOnly: true,
                controller: timeController,
                onTap: () async {
                  await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.inputOnly,
                          initialTime: TimeOfDay(
                              hour: DateTime.now().hour,
                              minute: DateTime.now().hour))
                      .then((value) {
                    if (value != null) {
                      timeController.text = value.format(context);
                      setState(() {});
                    }
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: "Select pickup address",
                controller: pickupAddressController,
                validator: Validators.checkFieldEmpty,
                onTap: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Container(
                            padding: const EdgeInsets.only(left: 36, right: 36),
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 55,
                                  child: DropdownButtonFormField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                        border: const OutlineInputBorder(
                                          gapPadding: 1,
                                          borderSide: BorderSide(
                                              color: Color(0xfffD9D9D9),
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        suffix: const Text(""),
                                        suffixIcon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        filled: true,
                                        hintStyle:
                                            Get.theme.textTheme.bodyMedium,
                                        hintText: "Select Province",
                                        fillColor: Colors.white),
                                    onChanged: (pro) {
                                      selectedProvince = pro;
                                      setState(() {});
                                    },
                                    // itemHeight: 48,
                                    items: province
                                        .map(
                                          (cityTitle) => DropdownMenuItem(
                                            value: cityTitle,
                                            child: SizedBox(
                                              height: 30,
                                              child: Text(
                                                "${cityTitle.name}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                // if (selectedProvice != null)
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: DropdownButtonFormField(
                                    icon: const Visibility(
                                        visible: false,
                                        child: Icon(Icons.arrow_downward)),
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                        border: const OutlineInputBorder(
                                          gapPadding: 1,
                                          borderSide: BorderSide(
                                              color: Color(0xfffD9D9D9),
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        suffix: const Text(""),
                                        suffixIcon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        filled: true,
                                        hintStyle:
                                            Get.theme.textTheme.bodyMedium,
                                        hintText: "Select District",
                                        fillColor: Colors.white),
                                    onChanged: (pro) {
                                      selectedDistrict = pro;
                                      setState(() {});
                                    },
                                    items: (selectedProvince?.districts ?? [])
                                        .map(
                                          (cityTitle) => DropdownMenuItem(
                                            value: cityTitle,
                                            child: Text(
                                              cityTitle.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),

                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  hint: 'Enter your city name',
                                  autoFocus: false,
                                  controller: cityController,
                                  // textInputType: TextInputType.multiline,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  hint: 'Enter your street address',
                                  autoFocus: false,
                                  controller: streetAddressController,
                                  // textInputType: TextInputType.multiline,
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff00183F),
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: (() {
                                    pickupAddressController.text =
                                        "${selectedProvince?.name ?? ""},${selectedDistrict?.name ?? ""},${cityController.text}, ${streetAddressController.text}";
                                    streetAddressController.text = "";
                                    Get.back();
                                  }),
                                  child: const Text("Next"),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          );
                        });
                      });
                },
                readOnly: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  readOnly: true,
                  controller: destinationAddressController,
                  validator: Validators.checkFieldEmpty,
                  hint: "Select destination address",
                  onTap: () {
                    showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 36, right: 36),
                              height: MediaQuery.of(context).size.height * 0.8,
                              // height: MediaQuery.of(context).size.height * 0.6,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: DropdownButtonFormField(
                                      icon: const Visibility(
                                          visible: false,
                                          child: Icon(Icons.arrow_downward)),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                          border: const OutlineInputBorder(
                                            gapPadding: 1,
                                            borderSide: BorderSide(
                                                color: Color(0xfffD9D9D9),
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),
                                          suffix: const Text(""),
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          filled: true,
                                          hintStyle:
                                              Get.theme.textTheme.bodyMedium,
                                          hintText: "Select Province",
                                          fillColor: Colors.white),
                                      onChanged: (pro) {
                                        selectedProvince = pro;
                                        setState(() {});
                                      },
                                      // itemHeight: 48,
                                      items: province
                                          .map(
                                            (cityTitle) => DropdownMenuItem(
                                              value: cityTitle,
                                              child: SizedBox(
                                                  height: 30,
                                                  child: Text(
                                                    "${cityTitle.name}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  )),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  // if (selectedProvice != null)
                                  Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: DropdownButtonFormField(
                                      icon: const Visibility(
                                          visible: false,
                                          child: Icon(Icons.arrow_downward)),
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                          border: const OutlineInputBorder(
                                            gapPadding: 1,
                                            borderSide: BorderSide(
                                                color: Color(0xfffD9D9D9),
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),
                                          suffix: const Text(""),
                                          suffixIcon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          filled: true,
                                          hintStyle:
                                              Get.theme.textTheme.bodyMedium,
                                          hintText: "Select District",
                                          fillColor: Colors.white),
                                      onChanged: (pro) {
                                        selectedDistrict = pro;
                                        setState(() {});
                                      },
                                      items: (selectedProvince?.districts ?? [])
                                          .map(
                                            (cityTitle) => DropdownMenuItem(
                                              value: cityTitle,
                                              child: Text(
                                                cityTitle.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    hint: 'Enter your city name',
                                    autoFocus: false,
                                    controller: cityController,
                                    // textInputType: TextInputType.multiline,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    hint: 'Enter your street address',
                                    autoFocus: false,
                                    controller: streetAddressController,
                                    // textInputType: TextInputType.multiline,
                                  ),
                                  const SizedBox(
                                    height: 38,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff00183F),
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: (() {
                                      destinationAddressController.text =
                                          "${selectedProvince?.name ?? ""},${selectedDistrict?.name ?? ""},${cityController.text}, ${streetAddressController.text}";
                                      streetAddressController.text = "";
                                      Navigator.pop(context);
                                    }),
                                    child: const Text("Next"),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00183F),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  if (keys.currentState!.validate()) {
                    Get.to(() => BookingSummary(
                          from: pickupAddressController.text,
                          to: destinationAddressController.text,
                          serviceProvider: widget.serviceProvider,
                          destinationAddressController:
                              destinationAddressController,
                          pickupaddressController: pickupAddressController,
                          pickupDateController: dateController,
                          pickUpTimeController: timeController,
                        ));
                  } else {}
                },
                child: const Text("Continue"),
              ),
              // SizedBox(height: 50),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xff00183F),
              //     minimumSize: const Size.fromHeight(50),
              //   ),
              //   onPressed: () {
              //     var test = item_model(
              //       itemId: itemController.selectedItems.map((element) {
              //         return ItemId(id: element.id, quantity: element.itemCount);
              //       }).toList(),
              //       serviceProviderId: widget.serviceProvider.id,
              //       pickupAddress: pickupAddressController.text,
              //       destinationAddress: destinationAddressController.text,
              //       pickupDate: dateController.text,
              //       pickupTime: timeController.text,
              //     ).toJson();
              //     print(test);

              //     postOrder(
              //         test: test,
              //         onSuccess: () {
              //           print("error 1234");
              //         },
              //         onError: (message) {
              //           print("error");
              //         });
              //   },
              //   child: Text("Testing"),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> postOrder(
      {required var test,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse("http://192.168.1.71:8000/api/orders/store");

      var body = json.encode(test);

      http.Response response = await http.post(url,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": StorageHelper.getToken()!.toString()
          },
          body: body);

      var data = json.decode(response.body);

      log("TESTING DATA =====> ${data}");
      log("TESTING DATA =====> ${body}");
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
