import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_compagno/data/repository/product_repo.dart';

class HomeController extends GetxController {
  final ProductsRepository repository;
  HomeController({required this.repository});
}
