import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/bought_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/bought_product_state.dart';

class BoughtProductCubit extends Cubit<BoughtProductState> {
  final BoughtProductsUseCase boughtProductsUseCase;

  BoughtProductCubit(this.boughtProductsUseCase)
      : super(BoughtProductInitial());

  int currentPage = 1;

  bool hasMore = true;
  bool isLoadingMore = false;

  final List<buyingOrderEntity> products = [];

  Future<void> getBoughtProducts() async {
    if (isLoadingMore) return;

    currentPage = 1;
    hasMore = true;
    products.clear();

    emit(BoughtProductLoading());

    try {
      final response = await boughtProductsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BoughtProductLoaded(
          products: List.from(products),
          hasMore: hasMore,
        ),
      );
    } on ApiException catch (e) {
      emit(BoughtProductError(e.message));
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final currentState = state;

    if (currentState is BoughtProductLoaded) {
      emit(
        BoughtProductLoaded(
          products: currentState.products,
          hasMore: currentState.hasMore,
          isLoadingMore: true,
        ),
      );
    }

    try {
      currentPage++;

      final response = await boughtProductsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BoughtProductLoaded(
          products: List.from(products),
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      currentPage--;

      emit(
        BoughtProductLoaded(
          products: List.from(products),
          hasMore: true,
          isLoadingMore: false,
        ),
      );

      print(e.message);
    } finally {
      isLoadingMore = false;
    }
  }
}
