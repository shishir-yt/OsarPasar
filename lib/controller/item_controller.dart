import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../repo/category_repo.dart';

class ItemController extends GetxController {
  final category = <CategoryItem>[].obs;
  final items = <Items>[].obs;
  final selectedItems = <Items>{}.obs;

  final selectedCategory = CategoryItem().obs;
  RxBool loading = false.obs;
  String name = "";
  final selectedItem = Items().obs;


  void getAllCatgegory(int id) async {
    Get.put(ItemController());
    final categoryContoller = Get.find<ItemController>();

    log("yhea samma aayo ");
    loading.value = true;
    await CategoryRepo.getCategory(
        id: id,
        onSuccess: (categories) {
          loading.value = false;
          categoryContoller.category.value = categories;

          ;
        },
        onError: (message) {
          loading.value = false;
        });

    log("data length:- ${category.length}");
  }

  RxInt counter = 1.obs;

  void incrementValue() {
    counter.value++;
  }

  void substractValue() {
    if (counter.value <= 1) {
      return;
    }
    counter.value--;
  }

  showCategory() {
    final categoryContoller = Get.find<ItemController>();
    // selectedItem.value = Items();
    print("Select Category:${categoryContoller.category.value.length}");
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45.0),
          ),
        ),
        context: Get.context!,
        builder: ((context) {
          return StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 63,
                    ),
                    const Text("Add Item"),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 55,
                      child: DropdownButtonFormField(
                        icon: const Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        alignment: AlignmentDirectional.bottomCenter,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: const OutlineInputBorder(
                              gapPadding: 1,
                              borderSide: BorderSide(
                                  color: Color(0xfffD9D9D9), width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            suffix: const Text(""),
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            filled: true,
                            hintStyle: Get.theme.textTheme.bodyMedium,
                            hintText: "Select Category",
                            fillColor: Colors.white),
                        onChanged: (value) {
                          if (value != null) {
                            // value.items??[];

                            selectedCategory.value = value;
                            items.value = value.items ?? [];
                            selectedItem.value = value.items?.first ?? Items();
                            setState(() {});
                          }
                          name = value.toString();
                        },
                        // value: selectedCategory.value,
                        itemHeight: 48,
                        items: category
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: SizedBox(
                                  height: 30,
                                  child: Text(
                                    "${category.name}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (items.value.isNotEmpty)
                      SizedBox(
                        height: 55,
                        child: DropdownButtonFormField(
                          icon: const Visibility(
                              visible: false,
                              child: Icon(Icons.arrow_downward)),
                          alignment: AlignmentDirectional.bottomCenter,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: const OutlineInputBorder(
                                gapPadding: 1,
                                borderSide: BorderSide(
                                    color: Color(0xfffD9D9D9), width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              suffix: const Text(""),
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              filled: true,
                              hintStyle: Get.theme.textTheme.bodyMedium,
                              hintText: "Select Items",
                              fillColor: Colors.white),
                          onChanged: (value) {
                            selectedItem.value = value ?? Items();
                            setState(() {});
                          },
                          // value: selectedItem.value,
                          itemHeight: 48,
                          value: selectedItem.value,
                          items: (selectedCategory.value.items ?? [])
                              .toSet()
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: SizedBox(
                                    height: 30,
                                    child: Text(
                                      "${item.name}",
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
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 46, right: 35, left: 35),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: const Color(0xff00183F),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          selectedItems.value.add(selectedItem.value);
                          selectedItems.refresh();
                          Get.back();
                          log(name.toString());
                        },
                        child: const Text("Continue"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }));
  }
}

// SizedBox(
//             height: 300,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: c.category.length,
//                 itemBuilder: (context, index) {
//                   CategoryItem category = c.category[index];
//                   return Text(
//                     category.name ?? "",
//                     style: const TextStyle(color: Colors.black),
//                   );
//                 }),

//           )
