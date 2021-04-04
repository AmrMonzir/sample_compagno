import 'package:sample_compagno/data/model/product.dart';
import 'package:sample_compagno/data/provider/products_api.dart';

class ProductsRepository {
  final ProductsApiClient apiClient;

  ProductsRepository({required this.apiClient});

  Future<List<Product>?> getAll() {
    return apiClient.getAll();
  }

  Future<Product?> getId({required int id}) {
    return apiClient.getId(id: id);
  }

  Future<List<Product?>> getProductsPage({required int page}) {
    return apiClient.getProductsPage(page: page);
  }
}
