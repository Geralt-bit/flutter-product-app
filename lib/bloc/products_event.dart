abstract class ProductsEvent {}

class LoadProducts extends ProductsEvent {}

class LoadProductDetail extends ProductsEvent {
  final int id;

  LoadProductDetail(this.id);
}