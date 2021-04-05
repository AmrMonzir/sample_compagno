import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/modules/app_binding.dart';
import 'package:sample_compagno/modules/home/home.dart';
import 'package:sample_compagno/routes/pages.dart';
import 'package:sample_compagno/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        initialRoute: Routes.HOME,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          backgroundColor: Colors.white,
          fontFamily: "Metro",
        ),
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: HomePage(),
      ),
    );
  }
}
