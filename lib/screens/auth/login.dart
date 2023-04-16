import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/auth/login_controller.dart';
import 'package:osar_pasar/screens/home.dart';

import 'package:osar_pasar/screens/auth/register.dart';

import '../../utils/validators.dart';
import '../../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  static const routeName = "/loginScreen";
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final c = Get.put(LoginController());

  var keys = GlobalKey<FormState>();

  bool visiblePassword = false;

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
                  key: keys,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00183F),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Email Address"),
                      ),
                      CustomTextField(
                        controller: c.emailTextController,
                        // prefixIcon: const Icon(
                        //   Icons.person,
                        //   size: 20,
                        // ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        hint: "Enter your email address",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Password"),
                      ),
                      CustomTextField(
                        controller: c.passwordTextController,

                        // prefixIcon: const Icon(
                        //   Icons.person,
                        //   size: 20,
                        // ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        hint: "Enter your password ",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
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
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Color(0xff00183F)),
                          ),
                        ),
                      ),
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
                            c.onSubmit();
                            print("submit");
                          } else {}
                        },
                        child: const Text("Login"),
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
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Register());
                        },
                        child: const Text(
                          "Register",
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
