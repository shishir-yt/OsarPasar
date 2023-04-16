import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:osar_pasar/models/provinces.dart';
import 'package:osar_pasar/utils/apis.dart';

class AddressController extends GetxController {
  var selectedDate = DateTime.now();
  final selectedProvice = NepalProvince(id: 0, name: "", districts: []).obs;

  final provinces = <NepalProvince>[].obs;
  chooseDate(BuildContext context, var selectedDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
    }
  }

  Future<List<NepalProvince>> get() async {
    var url = Uri.parse(OsarPasarAPI.provinces);
    var response = await http.get(url);
    List<NepalProvince> provinces = [];
    if (response.statusCode == 200) {
      print(response.body);
      provinces = provinceFromJson(response.body);
    }

    this.provinces.value = provinces;
    this.provinces.refresh();
    return provinces;
  }
}
