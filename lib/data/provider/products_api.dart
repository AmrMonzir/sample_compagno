import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://3.137.152.52/bagisto/public/api/products';

class ProductsApiClient extends GetConnect {
  final http.Client client;

  ProductsApiClient({required this.client});
}
