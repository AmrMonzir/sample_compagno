import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:sample_compagno/data/model/user.dart';
import 'package:sample_compagno/data/services/secure_storage.dart';

const baseUrl = 'http://3.137.152.52/bagisto/public/api/customer/';

class UserApi extends GetConnect {
  final http.Client client;
  UserApi({required this.client});

  Future<User> login(String email, String password) async {
    var response;
    try {
      var uri = Uri.parse(baseUrl + "login?token=true");
      response = await client.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "password": password,
          }));
    } on Exception catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)["token"];
      Get.find<SecureStorageController>().setToken(token: token);
      User user = User.fromJson(jsonDecode(response.body)["data"]);
      return user;
    } else if (response.statusCode == 401) {
      throw jsonDecode(response.body)["error"];
    } else {
      throw "Error logging in";
    }
  }

  Future<bool> signUp(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required String firstName,
      required String lastName,
      String? mobileNumber,
      String? address}) async {
    print(email);
    print(password);
    print(passwordConfirmation);
    print(firstName);
    print(lastName);
    var response;
    try {
      var uri = Uri.parse(baseUrl + "register");
      print(uri.toString());
      response = await client.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation,
          }));
    } on Exception catch (e) {
      print(e);
    }
    if (response.statusCode == 200)
      return true;
    else
      throw "This email has already been taken";
  }
}
