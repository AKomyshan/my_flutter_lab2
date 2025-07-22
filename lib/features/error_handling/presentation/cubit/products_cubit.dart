import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/error_handling/domain/fake_products_repository.dart';
import 'package:flutter_lab/features/error_handling/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repository) : super(const ProductsState.initial());

  final FakeProductsRepository repository;

  Future<void> getProducts() async {
    try {
      final products = await FakeProductsRepository().getProducts();

      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: e.toString(),
        ),
      );

      rethrow;
    }
  }
}
