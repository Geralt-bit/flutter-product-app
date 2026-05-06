import '../model/product_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductDetailLoaded extends ProductsState {
  final Product product;

  ProductDetailLoaded(this.product);
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}