import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';

abstract class productRepository{
  Future<List<ProductEntity>> fatchProducts();
}