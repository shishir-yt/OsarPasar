import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:osar_pasar/screens/about.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/faq.dart';
import 'package:osar_pasar/screens/home.dart';
import 'package:osar_pasar/screens/profile.dart';
import 'package:osar_pasar/screens/support.dart';
import 'package:osar_pasar/utils/storage_keys.dart';
import '../controller/core_controller.dart';
import '../controller/home_controller.dart';
import '../utils/image_path.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  final c = Get.put(HomeController());
  final coreController = Get.find<CoreController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  //bottomLeft: Radius.circular(20)),),
                  ),
              color: Color(0xff00183F),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: 'https://picsum.photos/100/100',
                      errorWidget: (context, url, error) => Image.asset(
                        ImagePath.on_board3,
                        fit: BoxFit.contain,
                      ),
                      // height: 87,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "${coreController.currentUser!.name?.capitalize}",
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.person_outline_rounded,
                  label: 'Profile',
                  onPressed: () => Get.to(EditProfile()),
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.question_mark_outlined,
                  label: 'FAQ',
                  onPressed: () {
                    Get.to(FaqPage());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.info_outline,
                  label: 'About',
                  onPressed: () {
                    Get.to(const AboutPage(
                      appDescription:
                          'Welcome to Osar Pasar, a leading packers and movers company based in Nepal. We are a team of experienced professionals dedicated to providing top-notch packing and moving services to our clients.\n \n'
                          'Our company was established with a vision to simplify the process of shifting and relocating for individuals and businesses alike. We understand that moving can be a stressful and overwhelming experience, which is why we strive to make the process as smooth and hassle-free as possible.At Osar Pasar, we pride ourselves on our commitment to customer satisfaction. We work closely with our clients to understand their specific needs and requirements, and tailor our services accordingly.'
                          'Whether you are moving locally or across the country, we have the expertise and resources to ensure a safe and timely relocation.Our team of packers and movers are highly trained and experienced in handling all types of goods, including fragile and valuable items. We use only the best quality packing materials to ensure that your belongings are safe and secure during transit.In addition to our packing and moving services, we also offer storage solutions for those who need to temporarily store their belongings.'
                          'Our storage facilities are clean, secure, and equipped with advanced security systems to ensure the safety of your goods.At Osar Pasar, we are committed to providing affordable and reliable packing and moving services to our clients. We believe in transparency and honesty in all our dealings, and strive to build long-term relationships with our clients based on trust and mutual respect.',
                      appDeveloperName: 'Shishir Acharya',
                      appName: 'Osar Pasar',
                      appVersion: 'v1.0.0',
                    ));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.support_agent,
                  label: 'Support',
                  onPressed: () {
                    Get.to(SupportPage());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onPressed: () async {
                    showDialog<void>(
                      context: Get.context!,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text('Are you sure you want to Logout?'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () async {
                                final box = GetStorage();
                                await box.write(StorageKey.ACCESS_TOKEN, null);
                                await box.write(StorageKey.USER, null);
                                Get.offAllNamed(Login.routeName);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xff00183F),
          ), //icon color
          const SizedBox(width: 20),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}

// Future<void> 
// showMyDialog() async {
//   return showDialog<void>(
//     context: Get.context!,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: SingleChildScrollView(
//           child: Column(
//             children: const [
//               Text('Are you sure you want to Logout?'),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             child: const Text(
//               'Logout',
//               style: TextStyle(
//                   color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             onPressed: () {
//               Get.offAll(Login());
//             },
//           ),
//           TextButton(
//             child: const Text(
//               'Cancel',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             onPressed: () {
//               Get.back();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
