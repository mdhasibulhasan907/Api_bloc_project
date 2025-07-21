import 'package:api_bloc_product/core/network.dart';
import 'package:api_bloc_product/feature/product/data/models/product_model.dart';
import 'package:api_bloc_product/feature/product/domain/product_entities/product_entity.dart';
import 'package:api_bloc_product/feature/product/domain/repositori/repository.dart';

class ProductRepositoryImplement implements productRepository {
  ApiClient _apiClient = ApiClient();

  @override
  Future<List<ProductEntity>> fatchProducts() async{
    try {

      final data=await  _apiClient.get(
        "/posts",
        headers: {'Content-Type':"application/json"}
      );
      return (data as List)
          .map((value) => ProductModel.fromJson(value))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Future<List<ProductEntity>> fatchProductsById(var id) async{
    try {

      final data=await  _apiClient.getBtId(
          "/posts",
          id,
          headers: {'Content-Type':"application/json"}
      );
      return [ProductModel.fromJson(data)];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  @override
  Future<ProductEntity> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.post(
        "/posts",
        data,
        headers: {'Content-Type': "application/json"},
      );
      return ProductModel.fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<ProductEntity> updateProductByPut(var id, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.putById(
        "/posts",
        id,
        data,
        headers: {'Content-Type': "application/json"},
      );
      return ProductModel.fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<ProductEntity> updateProductByPatch(var id, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.patchById(
        "/posts",
        id,
        data,
        headers: {'Content-Type': "application/json"},
      );
      return ProductModel.fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> deleteProduct(var id) async {
    try {
      await _apiClient.deletById(
        "/posts",
        id,
        headers: {'Content-Type': "application/json"},
      );
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
