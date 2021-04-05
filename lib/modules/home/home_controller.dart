import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
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

  Future<void> search({String? text}) async {
    //TODO search functionality
  }

  void toCart() {
    //TODO go to cart page
  }

  Future<bool> willPopCallBack() async {
    bool canceled = false;
    bool res = await Get.defaultDialog(
        title: "Log out",
        content: Text("Are you sure you want to log out?"),
        onConfirm: () {
          canceled = true;
          Get.back();
        },
        onCancel: () {
          canceled = false;
          Get.back();
        }).then((value) {
      return canceled;
    });
    return res;
  }
}
