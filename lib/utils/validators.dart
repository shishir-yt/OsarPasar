import 'package:get/get.dart';

class Validators {
  static String? checkFieldEmpty(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? checkPhoneField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (!(fieldContent.isNumericOnly && fieldContent.length == 10)) {
      return 'Invalid phone number';
    }

    return null;
  }

  static String? checkPasswordField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (fieldContent.length < 6) {
      return 'The password should be at least 6 digits';
    }
    return null;
  }

  static String? checkEmailField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isEmail(fieldContent)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? checkOptionalEmailField(String? fieldContent) {
    if (fieldContent == null) return null;
    if (fieldContent.isEmpty) return null;
    if (!GetUtils.isEmail(fieldContent)) {
      return 'Invalid email address';
    }
    return null;
  }
}
