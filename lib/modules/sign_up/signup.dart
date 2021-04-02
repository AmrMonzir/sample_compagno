import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/global_widgets/custom_textfield.dart';
import 'package:sample_compagno/global_widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0.128, 0.77),
                          end: Alignment(0.31, -1.3),
                          colors: [
                            Colors.white.withOpacity(0),
                            Color(0xff659CB5).withOpacity(0.6),
                            Color(0xff5994AF).withOpacity(0.8),
                            Color(0xff076188).withOpacity(0.8),
                          ],
                          stops: [0, 0.45, 0.6, 1],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset("assets/images/logo.png",
                      width: 173.w, height: 33.h),
                  top: 49.h,
                ),
                Positioned(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Color(0xff4A4B4D)),
                  ),
                  bottom: 16.h,
                  left: 129.w,
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
                    //TODO name has to be first name and last name
                    if(!value.toString().isAlphabetOnly)
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
                    if(!value.toString().isPhoneNumber)
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
                    GestureDetector(
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
