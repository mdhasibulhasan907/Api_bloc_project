import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class PatchProductUseCse{
  productRepository repository;
  PatchProductUseCse(this.repository);
  Future<ProductEntity> updateProductByPatch(var id, Map<String, dynamic> data) async {
    return await repository.updateProductByPatch(id, data);
  }

}