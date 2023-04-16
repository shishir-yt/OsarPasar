import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/splash_screen.dart';
import 'package:osar_pasar/utils/pages.dart';
import 'package:osar_pasar/utils/theme.dart';
import 'controller/core_controller.dart';
import 'controller/home_controller.dart';
import 'controller/item_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final a = Get.lazyPut(() => ItemController());

  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_0484f8952fb94b0d817aeefd670a8ef1',
      enabledDebugging: true,
      builder: (context, navigatorKey) {
        return GetBuilder<CoreController>(
          init: Get.put(CoreController()),
          builder: (context) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: basicTheme(),
              initialRoute: SplashScreen.routeName,
              navigatorKey: navigatorKey,
              localizationsDelegates: const [KhaltiLocalizations.delegate],
              initialBinding: BindingsBuilder(() {
                Get.put(CoreController());
              }),
              getPages: [...commonPages, ...userPages],
            );
          },
        );
      },
    );
  }
}
