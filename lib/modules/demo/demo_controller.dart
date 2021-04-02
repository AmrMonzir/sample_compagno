import 'package:get/get.dart';
import 'package:sample_compagno/routes/pages.dart';

class DemoController extends GetxController {
  Future<void> toLoginPage() async {
    Get.toNamed(Routes.LOGIN);
    return;
  }

  Future<void> toCreateAccountPage() async {
    Get.toNamed(Routes.SIGNUP);
    return;
  }
}
