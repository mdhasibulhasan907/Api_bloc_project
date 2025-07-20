import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;

  ProductEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [userId, id, title, body];
}
