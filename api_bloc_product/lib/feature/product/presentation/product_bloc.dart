import 'package:api_bloc_product/feature/product/data/usecase/getProductUseCase.dart';
import 'package:api_bloc_product/feature/product/presentation/product_event.dart';
import 'package:api_bloc_product/feature/product/presentation/product_state.dart';
import 'package:bloc/bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductBloc(this.getProductUseCase) : super(ProductInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(ProductLoading());

      try {
        final products = await getProductUseCase();
        emit(ProductLoaded(products));
      } catch (e) {
        //emit(ProductError(e.toString()));
        print(e.toString());
      }
    });
    on<FetchProductByIdEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await getProductUseCase.fetchProductsById(event.id);
        emit(ProductLoaded(result));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
