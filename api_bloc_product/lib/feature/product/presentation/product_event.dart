import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class FetchProductEvent extends ProductEvent {}

class FetchProductByIdEvent extends ProductEvent {
  final int id;

  FetchProductByIdEvent(this.id);
}
