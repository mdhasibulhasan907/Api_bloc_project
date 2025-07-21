import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class PutProductUseCase{
  productRepository repository;
  PutProductUseCase(this.repository);
  Future<ProductEntity> updateProductByPut(var id, Map<String, dynamic> data) async {
    return await repository.updateProductByPut(id, data);
  }
}