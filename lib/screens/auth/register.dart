import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/utils/validators.dart';

import '../../controller/auth/register_controller.dart';
import '../../widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static const routeName = "/register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final c = Get.put(RegisterController());

  bool visiblePassword = false;

  // final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Form(
                  key: c.registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "New Account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00183F),
                          ),
                        ),
                      ),
                      const Text(
                        "Lets start with creating an account",
                        style: TextStyle(
                          color: Color(0xff00183F),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Full Name"),
                      ),
                      CustomTextField(
                        controller: c.usernameController,
                        hint: 'Enter your full name',
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkFieldEmpty,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Email Address"),
                      ),
                      CustomTextField(
                        controller: c.emailController,
                        hint: 'Enter your email address',
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkEmailField,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Phone Number"),
                      ),
                      CustomTextField(
                        controller: c.phoneNumberController,
                        hint: 'Enter your phone number',
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: Validators.checkPhoneField,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Password"),
                      ),
                      CustomTextField(
                        controller: c.passwordController,
                        hint: 'Enter your password',
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscure: !visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visiblePassword = !visiblePassword;
                            });
                          },
                          icon: Icon(visiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        validator: Validators.checkPasswordField,
                      ),
                      // Obx(
                      //   (() => CustomTextField(
                      //         controller: c.passwordController,
                      //         validator: Validators.checkPasswordField,
                      //         prefixIcon: const Icon(
                      //           Icons.lock_outline,
                      //           size: 16,
                      //         ),
                      //         suffixIcon: InkWell(
                      //           onTap: c.onEyeClick,
                      //           // child: SvgPicture.asset(
                      //           //   c.passwordObscure.value
                      //           // ? ImagePath.EYE
                      //           // : ImagePath.EYE_OFF,
                      //           //   color: AppColors.textColor,
                      //           //   fit: BoxFit.scaleDown,
                      //           // ),
                      //         ),
                      //         obscure: c.passwordObscure.value,
                      //         hint: "Password",
                      //         textInputAction: TextInputAction.next,
                      //         textInputType: TextInputType.emailAddress,
                      //       )),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00183F),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: c.submit,
                        child: const Text("Register"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Login());
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xff00183F),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
