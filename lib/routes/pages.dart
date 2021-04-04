import 'package:get/get.dart';
import 'package:sample_compagno/modules/app_binding.dart';
import 'package:sample_compagno/modules/demo/demo.dart';
import 'package:sample_compagno/modules/home/home.dart';
import 'package:sample_compagno/modules/login/login.dart';
import 'package:sample_compagno/modules/sign_up/signup.dart';
part './routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: AppBinding()),
    GetPage(
        name: Routes.SIGNUP, page: () => SignUpPage(), binding: AppBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.DEMO, page: () => DemoPage(), binding: AppBinding()),
  ];
}
