import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/item_controller.dart';
import 'package:osar_pasar/models/service_provider.dart';
import 'package:osar_pasar/screens/address.dart';
import 'package:osar_pasar/widgets/custom_snackbar.dart';

import '../utils/colors.dart';

class ItemAddScreen extends StatelessWidget {
  ItemAddScreen({super.key, required this.serviceProvider});
  ServiceProvider serviceProvider;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ItemController());

    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            c.selectedItems.clear();
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                c.showCategory();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          "Item List",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
      ),
      body: GetX<ItemController>(builder: (c) {
        if (c.selectedItems.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xff00183F),
                  ),
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  c.showCategory();
                },
                child: Text(
                  "Add Item",
                  style: textTheme.titleMedium!
                      .copyWith(fontSize: 16, color: AppColors.textColor),
                ),
              ),
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: c.selectedItems.value.map((e) {
              return Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${e.name}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (e.itemCount > 1) {
                                  e.itemCount--;
                                  c.selectedItems.refresh();
                                } else {
                                  c.selectedItems.value.remove(e);
                                  c.selectedItems.refresh();
                                }
                              },
                            ),
                          ),
                          Text("${e.itemCount}"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                if (e.itemCount < 10) {
                                  e.itemCount++;
                                  c.selectedItems.refresh();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            }).toList(),
          );
        }
      }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 46, right: 35, left: 35),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(
              0xff00183F,
            ),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            if (c.selectedItems.isNotEmpty) {
              Get.to(AddressPage(
                serviceProvider: serviceProvider,
              ));
            } else {
              CustomSnackBar.error(
                  message: "Please add one or more items to proceed",
                  title: "Nothing to Shift");
            }
          },
          child: const Text(
            "Continue",
          ),
        ),
      ),
    );
  }
}
