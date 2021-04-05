import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/global_widgets/rounded_button.dart';
import 'package:sample_compagno/utils/constants.dart';
import 'demo_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoPage extends StatelessWidget {
  final controller = Get.put<DemoController>(DemoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.white, Color(0xff10409C), Colors.black],
                  center: Alignment.center,
                  radius: 1.8)),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset("assets/images/Splash screen.png",
                      fit: BoxFit.fill)),
              Positioned(
                child: ListView(
                  children: [
                    Image.asset("assets/images/demo.png",
                        height: 320.h, width: 320.w),
                    SizedBox(height: 16.h),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 49.h,
                    ),
                    SizedBox(height: 88.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 52),
                      child: Text(
                        "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: RoundedButton(
                        onPress: controller.toLoginPage,
                        color: kPrimaryColor,
                        text: "Login",
                        textStyle: kButtonTextStyle,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: RoundedButton(
                        onPress: controller.toCreateAccountPage,
                        color: Colors.transparent,
                        borderColor: Color(0xff065A81),
                        text: "Create an Account",
                        textStyle: kButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
