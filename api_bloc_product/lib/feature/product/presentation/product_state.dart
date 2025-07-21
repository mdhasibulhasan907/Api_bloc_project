import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;
  ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
  @override
  List<Object?> get props => [message];
}

class ProductActionSuccess extends ProductState {
  final String message;
  ProductActionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}