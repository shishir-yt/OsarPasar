import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_field.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = "/edit-profile";
  EditProfile({super.key});

  // final c = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
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
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          // key: c.formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      //  (c.image.value != null)
                      //     ? Image.file(
                      //         c.image.value!,
                      //         fit: BoxFit.cover,
                      //         height: 120,
                      //         width: 120,
                      //       )
                      //     :
                      CachedNetworkImage(
                    // imageUrl: c.user.value?.profileImageUrl ?? "",
                    imageUrl: "https://picsum.photos/seed/picsum/200/300",
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.network(
                      "https://picsum.photos/seed/picsum/200/300",
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Change Avatar",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  // controller: c.nameController,
                  hint: "Full Name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  validator: Validators.checkFieldEmpty,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextField(
                  // controller: c.emailController,
                  // labelText: "Email",
                  hint: "Email",
                  readOnly: true,
                  // border: AppColors.lGrey,
                  textInputAction: TextInputAction.none,
                  textInputType: TextInputType.none,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextField(
                  // controller: c.phoneController,
                  hint: "Phone Number",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  validator: Validators.checkPhoneField,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
