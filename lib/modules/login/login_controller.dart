import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_compagno/data/model/user.dart';
import 'package:sample_compagno/data/provider/user_api.dart';
import 'package:sample_compagno/data/services/user_service.dart';
import 'package:sample_compagno/routes/pages.dart';
import 'package:sample_compagno/utils/constants.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;

  Future<void> login() async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    if (email.value == "" && password.value == "") return;
    UserApi userApi = UserApi(client: new http.Client());
    try {
      User user = await userApi.login(email.value, password.value);
      Get.back();
      Get.find<UserService>().setUser(user);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString(), backgroundColor: kFailedSnackBar);
    }
  }

  Future<void> loginWithFacebook() async {
    return;
  }

  Future<void> loginWithGoogle() async {
    return;
  }

  toSignUpPage() {
    Get.offNamed(Routes.SIGNUP);
  }

  Future<void> forgotPassword() async {
    return;
  }
}
