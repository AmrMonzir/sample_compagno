import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/data/model/user.dart';
import 'package:sample_compagno/data/provider/user_api.dart';
import 'package:sample_compagno/data/services/user_service.dart';
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
    UserApi userApi = UserApi(client: new http.Client());
    try {
      bool result = await userApi.signUp(
        password: password.value,
        email: email.value,
        firstName: name.value.split(" ")[0],
        lastName: name.value.split(" ")[1],
        passwordConfirmation: confirmedPassword.value,
        // address: address.value,
        // mobileNumber: mobileNumber.value
      );
      if (result) {
        Get.snackbar("Success!", "Sign up successful, logging you in...");
        await login(userApi);
        Get.offAllNamed(Routes.HOME);
      }
      Get.back();
    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString(), backgroundColor: kFailedSnackBar);
    }
    return;
  }

  Future<void> login(UserApi userApi) async {
    try {
      User user = await userApi.login(email.value, password.value);
      Get.find<UserService>().setUser(user);
    } catch (e) {
      Get.snackbar("Error", "Error logging you in, please try again!",
          backgroundColor: kFailedSnackBar);
      toLoginPage();
    }
  }
}
