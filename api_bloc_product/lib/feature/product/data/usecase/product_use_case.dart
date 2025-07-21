import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class ProductUseCase {
  productRepository repository;
  ProductUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.fatchProducts();
  }
  Future<List<ProductEntity>> fetchProductsById(var id) async {
    return await repository.fatchProductsById(id);
  }
  Future<ProductEntity> createProduct(Map<String, String> data) async {
    return await repository.createProduct(data);
  }
  Future<bool> deleteProduct(var id) async {
    return await repository.deleteProduct(id);
  }

  Future<ProductEntity> updateProductByPut(var id, Map<String, String> data) async {
    return await repository.updateProductByPut(id, data);
  }

  Future<ProductEntity> updateProductByPatch(var id, Map<String, String> data) async {
    return await repository.updateProductByPatch(id, data);
  }
}
