import 'package:dio/dio.dart';
import '../model/product_model.dart';

class ProductApi {
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('https://dummyjson.com/products');

    final List products = response.data['products'];
    return products.map((json) => Product.fromJson(json)).toList();
  }

  Future<Product> fetchProductById(int id) async {
    final response = await dio.get('https://dummyjson.com/products/$id');

    return Product.fromJson(response.data);
  }
}