import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class GetProductUseCase {
  productRepository repository;

  GetProductUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.fatchProducts();
  }
  Future<List<ProductEntity>> fetchProductsById(var id) async {
    return await repository.fatchProductsById(id);
  }
}
