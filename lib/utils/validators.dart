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
    RegExp pass_valid = RegExp(r"(?=.\d)(?=.[a-z])(?=.[A-Z])(?=.\W)");
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (fieldContent.length < 8) {
      return 'The password should be at least 8 digits';
    }
    // else if (pass_valid.hasMatch(fieldContent)) {
    //   return 'Password should contain Capital Letter,\nSmall Letter,Numeric & Special Character';
    // }
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
