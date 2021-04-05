import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/global_widgets/custom_textfield.dart';
import 'package:sample_compagno/global_widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_compagno/global_widgets/top_gradient.dart';
import 'package:sample_compagno/modules/sign_up/signup_controller.dart';
import 'package:sample_compagno/utils/constants.dart';

class SignUpPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = Get.put<SignUpController>(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 168.h,
            child: Stack(
              children: [
                TopGradient(),
                Positioned(
                  child: Image.asset("assets/images/logo.png",
                      width: 173.w, height: 33.h),
                  top: 49.h,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          color: Color(0xff4A4B4D)),
                    ),
                  ),
                  bottom: 16.h,
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Add your details to sign up",
                    style: TextStyle(color: Color(0xff7C7D7E), fontSize: 14),
                  ),
                ),
                SizedBox(height: 37.h),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.toString().split(" ").length != 2)
                      return 'Please enter a separate first name and last name';
                    if (!value.toString().split(" ")[0].isAlphabetOnly ||
                        !value.toString().split(" ")[1].isAlphabetOnly)
                      return 'Name has to contain only alphabetic characters';
                    if (value.length > 20)
                      return 'Name cannot be more than 20 characters long';
                    return null;
                  },
                  onSaved: (value) => controller.name.value = value!,
                  hint: "Name",
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return 'Please enter a valid email address';
                    } else
                      return null;
                  },
                  onSaved: (value) => controller.email.value = value!,
                  hint: "Your Email",
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.toString().isEmpty) return null;
                    if (!value.toString().isPhoneNumber)
                      return 'Please enter a valid phone number';
                    return null;
                  },
                  onSaved: (value) => controller.mobileNumber.value = value!,
                  hint: "Mobile No",
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.length > 20)
                      return "Address cannot be longer than 20 characters";
                    return null;
                  },
                  onSaved: (value) => controller.address.value = value!,
                  hint: "Address",
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password cannot be less than 6 characters';
                    } else
                      return null;
                  },
                  onSaved: (value) => controller.password.value = value!,
                  hint: "Password",
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value.length < 6) {
                      return 'Password cannot be less than 6 characters';
                    } else if (value != controller.password.value)
                      return 'Passwords do not match';
                    return null;
                  },
                  onSaved: (value) =>
                      controller.confirmedPassword.value = value!,
                  hint: "Confirm Password",
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: RoundedButton(
                    onPress: () async {
                      final FormState form = formKey.currentState!;
                      form.validate() ? form.save() : print('error signing up');
                      if (form.validate()) {
                        await controller.signUp();
                      }
                    },
                    color: kPrimaryColor,
                    text: "Sign Up",
                    textStyle: kButtonTextStyle,
                  ),
                ),
                SizedBox(height: 28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                          color: Color(0xff7c7d7e),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: controller.toLoginPage,
                      child: Text(
                        " Login",
                        style: TextStyle(
                            color: Color(0xffFC6011),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 26.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
