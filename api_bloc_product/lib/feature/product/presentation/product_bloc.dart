import 'package:api_bloc_product/feature/product/data/usecase/product_use_case.dart';
import 'package:api_bloc_product/feature/product/presentation/product_event.dart';
import 'package:api_bloc_product/feature/product/presentation/product_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

 TextEditingController title=TextEditingController();
 TextEditingController body=TextEditingController();
  final ProductUseCase productUseCase;

  ProductBloc(this.productUseCase) : super(ProductInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());

      try {
        final products = await productUseCase();
        emit(ProductLoaded(products));
      } catch (e) {
        //emit(ProductError(e.toString()));
        print(e.toString());
      }
    });
    on<FetchProductByIdEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await productUseCase.fetchProductsById(event.id);
        emit(ProductLoaded(result));
      } catch (e) {
        print(e.toString());
      }
    });

    on<CreateProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        Map<String, String> data = {
          'title': title.text.trim(),
          'body': body.text.trim(),

        };
        await productUseCase.createProduct(data);
        emit(ProductActionSuccess("Product created successfully"));
        add(FetchProductEvent());
      } catch (e) {
        emit(ProductError("Failed to create product"));
      }
    });

    on<PutProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        Map<String, String> data = {
          'title': title.text.trim(),
          'body': body.text.trim(),
        };
        await productUseCase.updateProductByPut(event.id, data);
        emit(ProductActionSuccess("Product updated (PUT) successfully"));
        add(FetchProductEvent());
      } catch (e) {
        emit(ProductError("Failed to update product (PUT)"));
      }
    });

    on<PatchProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        // যদি fieldsToUpdate-এ সমস্যা থাকে, এখানে সেটাও Map<String, String> বানাতে হবে
        Map<String, String> data = event.fieldsToUpdate.map(
              (key, value) => MapEntry(key, value.toString()),
        );
        await productUseCase.updateProductByPatch(event.id, data);
        emit(ProductActionSuccess("Product updated (PATCH) successfully"));
        add(FetchProductEvent());
      } catch (e) {
        emit(ProductError("Failed to update product (PATCH)"));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        await productUseCase.deleteProduct(event.id);
        emit(ProductActionSuccess("Product deleted successfully"));
        add(FetchProductEvent());
      } catch (e) {
        emit(ProductError("Failed to delete product"));
      }
    });
  }
}
