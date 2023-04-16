import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../controller/core_controller.dart';
import '../models/user_model.dart';
import '../utils/apis.dart';
import '../utils/storage_keys.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = json.encode({
        "email": email,
        "password": password,
      });
      http.Response response = await http.post(
          Uri.parse(
            OsarPasarAPI.login,
          ),
          headers: headers,
          body: body);

      dynamic data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        final box = GetStorage();
        // log("--------------------------------  ${data['data']["user"]}");
        // log("--------------------------------  ${data["data"]["token"]}");
        // User user = User.fromJson(data['user']);
        // Accesstoken accessToken = Accesstoken.fromJson(data['token']);
        // log(user.email.toString());
        await box.write(
            StorageKey.ACCESS_TOKEN, json.encode(data["data"]["token"]));
        await box.write(StorageKey.USER, data["data"]["user"]);
        Get.find<CoreController>().loadCurrentUser();
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Something went wrong");
    }
  }

  static Future<void> registerUser({
    required User user,
    required String password,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = json.encode({
        "email": user.email,
        "password": password,
        'phone_number': user.phoneNumber,
        'name': user.name,
        // 'type': '2',
      });
      http.Response response = await http.post(
          Uri.parse(
            OsarPasarAPI.register,
          ),
          headers: headers,
          body: body);
      dynamic data = jsonDecode(response.body);
      if (data["status"]) {
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("Something went wrong");
    }
  }
}
