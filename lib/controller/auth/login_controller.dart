import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/screens/home.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../repo/auth_repo.dart';
import '../../widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  // var formKey = GlobalKey<FormState>();
  var passwordObscure = true.obs;
  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context, barrierDimisable: false);

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  void onSubmit() async {
    log("on submit ma aayo ");

    await AuthRepo.loginUser(
      email: emailTextController.text,
      password: passwordTextController.text,
      onSuccess: () {
        log("aayo login successful");
        Get.off(HomePage());
        CustomSnackBar.success(
            title: "Login Successful", message: "Logged in succesfully");
      },
      // (user) {
      //   log("sucess vayo");
      //   // homeController.setUser(user);
      //   Get.off(HomePage());
      //   CustomSnackBar.success(
      //       title: "Login Successful", message: "Logged in succesfully");
      // },
      onError: (message) {
        loading.hide();
        CustomSnackBar.error(message: message, title: "Login");
      },
    );
  }
}
