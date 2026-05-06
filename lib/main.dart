import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/products_bloc.dart';
import 'data/product_api.dart';
import 'data/product_repository.dart';
import 'pages/product_page.dart';

void main() {
  final repository = ProductRepository(ProductApi());

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductRepository repository;

  const MyApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductsPage(),
      ),
    );
  }
}