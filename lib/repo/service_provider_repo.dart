import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:osar_pasar/utils/apis.dart';
import '../models/service_provider.dart';

class ServiceProviderRepo {
  static Future<void> getServiceProvider(
      {required Function(List<ServiceProvider>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var url = Uri.parse(OsarPasarAPI.serviceProvider);

      http.Response response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status']) {
        log("on sucess ma aayo");
        log("-->(${data['data']['serviceProviders'].toString()})");
        onSuccess(serviceProviderFromJson(data['data']["serviceProviders"]));
        // print(data.toString());
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
