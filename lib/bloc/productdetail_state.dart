import 'package:meta/meta.dart';

import '../model/productdetail_model.dart';


abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded({required this.product});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
