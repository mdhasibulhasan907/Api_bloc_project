import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class CreateProductUseCase {
  productRepository repository;
  CreateProductUseCase(this.repository);
  Future<ProductEntity> createProduct(Map<String, dynamic> data) async {
    return await repository.createProduct(data);
  }
}
