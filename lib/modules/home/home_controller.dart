import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/data/model/product.dart';
import 'package:sample_compagno/data/repository/product_repo.dart';

class HomeController extends GetxController {
  final ProductsRepository repository;
  HomeController({required this.repository});

  var products = <Product?>[].obs;
  var currentDeal = 0.obs;
  late CarouselController carouselController;

  @override
  void onInit() {
    fetchProducts();
    carouselController = CarouselController();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    var res = await repository.apiClient.getAll();
    if (res == null) return;
    products.addAll(res.toList());
  }
}
