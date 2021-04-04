import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/global_widgets/custom_textfield.dart';
import 'package:sample_compagno/global_widgets/rounded_button.dart';
import 'package:sample_compagno/global_widgets/top_gradient.dart';
import 'package:sample_compagno/utils/constants.dart';
import 'login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();

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
                Positioned(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Color(0xff4A4B4D)),
                  ),
                  bottom: 16.h,
                  left: 147.w,
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
                    "Add your details to login",
                    style: TextStyle(color: Color(0xff7C7D7E), fontSize: 14),
                  ),
                ),
                SizedBox(height: 35.h),
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
                SizedBox(height: 28.h),
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
                SizedBox(height: 28.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: RoundedButton(
                    onPress: () async {
                      final FormState form = formKey.currentState!;
                      form.validate() ? form.save() : print('error logging in');
                      if (form.validate()) {
                        await controller.login();
                      }
                    },
                    color: kPrimaryColor,
                    text: "Login",
                    textStyle: kButtonTextStyle,
                  ),
                ),
                SizedBox(height: 28.h),
                Center(
                  child: InkWell(
                    onTap: controller.forgotPassword,
                    child: Text("Forgot your password?",
                        style: TextStyle(
                            color: Color(0xff7c7d7e),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: 28.h),
                Center(
                  child: Text("or Login With",
                      style: TextStyle(
                          color: Color(0xff7c7d7e),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: RoundedButton(
                    leading: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/Facebook.svg",
                          height: 15.h,
                        ),
                        SizedBox(width: 20.w)
                      ],
                    ),
                    onPress: controller.loginWithFacebook,
                    color: Color(0xff367FC0),
                    text: "Login with Facebook",
                    textStyle: kButtonTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 28.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: RoundedButton(
                    leading: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/google.svg",
                          height: 15.h,
                        ),
                        SizedBox(width: 20.w)
                      ],
                    ),
                    onPress: controller.loginWithGoogle,
                    color: kPrimaryColor,
                    text: "Login with Google",
                    textStyle: kButtonTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    borderColor: Color(0xffDD4B39),
                  ),
                ),
                SizedBox(height: 53.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(
                          color: Color(0xff7c7d7e),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: controller.toSignUpPage,
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                            color: Color(0xffCD242E),
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
