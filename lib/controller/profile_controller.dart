import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:osar_pasar/utils/snackbar.dart';

import '../models/user_model.dart';
import '../utils/apis.dart';
import '../utils/storage_helper.dart';
import '../utils/storage_keys.dart';
import 'core_controller.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final coreController = Get.find<CoreController>();
  final picker = ImagePicker();

  Rxn<User> user = Rxn<User>();
  Rxn<File> image = Rxn<File>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() {
    user.value = coreController.currentUser.value;
    nameController.text = user.value?.name ?? "";
    phoneController.text = user.value?.phoneNumber ?? "";
    emailController.text = user.value?.email ?? "";
  }

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }

  String? getImageString() {
    if (image.value == null) return null;

    final bytes = File(image.value!.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    return base64Image;
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      updateProfile(
        image: getImageString(),
        name: nameController.text,
        phone: phoneController.text,
        onSuccess: (user, message) async {
          final box = GetStorage();

          await box.write(StorageKey.USER, user.toJson());
          coreController.loadCurrentUser();
          Get.back();
          OsarPasarSnackBar.success(
              message: "Profile update succesfully", title: "Profile Update");
        },
        onError: (message) {
          OsarPasarSnackBar.success(title: "Profile Update", message: message);
        },
      );
    }
  }

  Future<void> updateProfile(
      {required String name,
      required String phone,
      String? image,
      required Function(User user, String message) onSuccess,
      required Function(String message) onError}) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Authorization": StorageHelper.getToken()!.toString(),
      };

      var body = {
        "name": name,
        "phone": phone,
      };

      if (image != null) body['profile_image'] = image;

      http.Response response = await http.post(
          Uri.parse(OsarPasarAPI.updateProfile),
          headers: headers,
          body: body);

      log("${OsarPasarAPI.updateProfile} ==============>");
      log(response.body);

      dynamic data = json.decode(response.body);

      if (data["success"] as bool) {
        User user = User.fromJson(data["data"]);
        onSuccess(user, data['message']);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Sorry! Something went wrong");
    }
  }
}
