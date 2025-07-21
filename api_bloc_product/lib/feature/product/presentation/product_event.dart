import 'package:equatable/equatable.dart';

import '../domain/product_entities/product_entity.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}
//get event
class FetchProductEvent extends ProductEvent {}
//get by id ecent
class FetchProductByIdEvent extends ProductEvent {
  final int id;

  FetchProductByIdEvent(this.id);
}

// CREATE
class CreateProductEvent extends ProductEvent {
  final ProductEntity product;
  CreateProductEvent(this.product);
  @override
  List<Object?> get props => [product];
}

// PUT (Full Update)
class PutProductEvent extends ProductEvent {
  final int id;
  final ProductEntity product;
  PutProductEvent(this.id, this.product);
  @override
  List<Object?> get props => [id, product];
}

// PATCH (Partial Update)
class PatchProductEvent extends ProductEvent {
  final int id;
  final Map<String, dynamic> fieldsToUpdate;
  PatchProductEvent(this.id, this.fieldsToUpdate);
  @override
  List<Object?> get props => [id, fieldsToUpdate];
}

// DELETE
class DeleteProductEvent extends ProductEvent {
  final int id;
  DeleteProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}