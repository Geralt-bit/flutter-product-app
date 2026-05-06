import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/product_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductsLoading());

      try {
        final products = await repository.getProducts();
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });

    on<LoadProductDetail>((event, emit) async {
      emit(ProductsLoading());

      try {
        final product = await repository.getProductById(event.id);
        emit(ProductDetailLoaded(product));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });
  }
}