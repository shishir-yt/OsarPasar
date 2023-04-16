import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/auth/register.dart';
import '../utils/image_path.dart';
import '../utils/storage_keys.dart';
import '../widgets/onboard_items.dart';

class OnBoardingController extends GetxController {
  var current_index = 0.obs;

  var onBoardItems = [
    const OnBoardItems(
      imagepath: ImagePath.on_board1,
      title: "Fast moving service",
    ),
    const OnBoardItems(
      imagepath: ImagePath.on_board2,
      title: "Easy merchant payment",
    ),
    const OnBoardItems(
      imagepath: ImagePath.on_board3,
      title: "Get 10% off on your first shift",
    ),
  ];

  void onNextTap() {
    if (current_index == onBoardItems.length - 1) {
      Get.to(() => Register());
      return;
    }
    current_index++;
  }

  void onPreviousTap() {
    if (current_index == 0) return;
    current_index--;
  }

  void onSkip() {
    Get.off(() => Login());
  }

  void onDone() {
    final box = GetStorage();
    box.write(StorageKey.APP_LOAD_DATE, DateTime.now().toString());
    Get.offNamed(Login.routeName);
  }
}
