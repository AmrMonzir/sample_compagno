import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/data/provider/user_api.dart';
import 'package:sample_compagno/routes/pages.dart';
import 'package:http/http.dart' as http;
import 'package:sample_compagno/utils/constants.dart';

class SignUpController extends GetxController {
  var email = "".obs;
  var name = "".obs;
  var mobileNumber = "".obs;
  var address = "".obs;
  var password = "".obs;
  var confirmedPassword = "".obs;

  toLoginPage() {
    Get.offAndToNamed(Routes.LOGIN);
  }

  Future<void> signUp() async {
    Get.dialog(Center(child: CircularProgressIndicator()));
    if (email.value == "" && password.value == "") return;
    UserApi userApi = UserApi(client: new http.Client());
    try {
      var result = await userApi.signUp(
          password: password.value,
          email: email.value,
          firstName: name.value,
          lastName: name.value,
          passwordConfirmation: confirmedPassword.value,
          address: address.value,
          mobileNumber: mobileNumber.value);
      Get.back();
      // Get.find<UserService>().setUser(user);
      // Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString(), backgroundColor: kFailedSnackBar);
    }
    return;
  }
}
