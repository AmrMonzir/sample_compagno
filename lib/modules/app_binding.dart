import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sample_compagno/data/provider/products_api.dart';
import 'package:sample_compagno/data/repository/product_repo.dart';
import 'package:sample_compagno/data/services/secure_storage.dart';
import 'package:sample_compagno/data/services/user_service.dart';
import 'package:sample_compagno/modules/home/home_controller.dart';
import 'login/login_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecureStorageController>(() {
      return SecureStorageController();
    });
    Get.lazyPut<UserService>(() {
      return UserService();
    });
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: ProductsRepository(
              apiClient: ProductsApiClient(client: http.Client())));
    });
  }
}
