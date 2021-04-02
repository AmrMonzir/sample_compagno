import 'package:get/get.dart';
import 'package:sample_compagno/data/model/user.dart';

class UserService extends GetxService {
  User? user;

  setUser(User user) {
    this.user = user;
  }

  getCurrentUser() {
    return this.user;
  }
}
