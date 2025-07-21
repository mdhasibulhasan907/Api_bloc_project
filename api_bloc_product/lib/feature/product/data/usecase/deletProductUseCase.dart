import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class DeletProductUseCase {
  productRepository repository;
  DeletProductUseCase(this.repository);
  Future<bool> deleteProduct(var id) async {
    return await repository.deleteProduct(id);
  }
}