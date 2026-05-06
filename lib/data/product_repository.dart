import '../model/product_model.dart';
import 'product_api.dart';

class ProductRepository {
  final ProductApi api;

  ProductRepository(this.api);

  Future<List<Product>> getProducts() {
    return api.fetchProducts();
  }

  Future<Product> getProductById(int id) {
    return api.fetchProductById(id);
  }
}