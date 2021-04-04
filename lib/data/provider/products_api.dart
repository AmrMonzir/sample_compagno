import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_compagno/data/model/product.dart';

const baseUrl = 'http://3.137.152.52/bagisto/public/api/products';

class ProductsApiClient extends GetConnect {
  final http.Client client;

  ProductsApiClient({required this.client});

  Future<List<Product>?> getAll() async {
    // String token = await Get.find<SecureStorageController>().getToken();
    try {
      var uri = Uri.parse(baseUrl);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body)["data"];
        return jsonResponse.map((model) => Product.fromJson(model)).toList();
      } else {
        print("response error = ${response.statusCode}");
        return null;
      }
    } catch (_) {
      print("error = $_");
      return [];
    }
  }

  Future<List<Product?>> getProductsPage({required int page}) async {
    try {
      var uri = Uri.parse(baseUrl + "?page=$page");
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        Iterable jsonResponse = jsonDecode(response.body)["data"];
        return jsonResponse.map((model) => Product.fromJson(model)).toList();
      } else {
        print("response error = ${response.statusCode}");
        return [];
      }
    } catch (_) {
      print("error = $_");
      return [];
    }
  }

  Future<Product?> getId({required int id}) async {
    // String token = await Get.find<SecureStorageController>().getToken();
    var uri = Uri.parse(baseUrl + "/$id");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body)["data"]);
    } else {
      print("response error = ${response.statusCode}");
      return null;
    }
  }
}
