import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';

abstract class productRepository {
  // Get all products
  Future<List<ProductEntity>> fatchProducts();
  // Get product by ID
  Future<List<ProductEntity>> fatchProductsById(var id);
  // POST: Create a product
  Future<ProductEntity> createProduct(Map<String, String> data);
  // PUT: Full update of a product
  Future<ProductEntity> updateProductByPut(var id, Map<String, String> data);
  // PATCH: Partial update of a product
  Future<ProductEntity> updateProductByPatch(var id, Map<String, String> data);
  // DELETE: Remove a product by ID
  Future<bool> deleteProduct(var id);
}
