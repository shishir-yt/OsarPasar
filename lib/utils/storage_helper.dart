import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:osar_pasar/utils/storage_keys.dart';

import '../models/access_token.dart';
import '../models/user_model.dart';

class StorageHelper {
  static DateTime? getAppLoadedDate() {
    try {
      final box = GetStorage();
      var fetchedDate = box.read(StorageKey.APP_LOAD_DATE);
      if (fetchedDate != null) {
        DateTime dateTime = DateTime.parse(fetchedDate);
        return dateTime;
      } else {
        return null;
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  static AccessToken? getToken() {
    try {
      final box = GetStorage();
      AccessToken token = AccessToken.fromJson(
          jsonDecode(box.read(StorageKey.ACCESS_TOKEN)) ?? "");
      log("--------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>${StorageKey.ACCESS_TOKEN}");
      return token;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static User? getUser() {
    try {
      final box = GetStorage();
      User user = User.fromJson(box.read(StorageKey.USER));

      log("--------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>${User.fromJson(box.read(StorageKey.USER))}");
      return user;
    } catch (e, s) {
      log(e.toString());
      return null;
    }
  }
}
