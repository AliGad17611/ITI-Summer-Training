import 'package:day12/models/products_model.dart';

class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsLoaded extends GetProductsState {
  final Products products;
  GetProductsLoaded(this.products);
}

class GetProductsError extends GetProductsState {
  final String error;
  GetProductsError(this.error);
}
