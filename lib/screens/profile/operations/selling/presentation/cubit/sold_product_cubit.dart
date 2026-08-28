import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_state.dart';

class SoldProductCubit extends Cubit<SoldProductState> {
  final SoldProductsUseCase soldProductsUseCase;

  SoldProductCubit(this.soldProductsUseCase)
      : super(SoldProductInitial());

  int currentPage = 1;

  bool hasMore = true;
  bool isLoadingMore = false;

  final List<SellingOrderEntity> products = [];

  Future<void> getSoldProducts() async {
    if (isLoadingMore) return;

    currentPage = 1;
    hasMore = true;
    products.clear();

    emit(SoldProductLoading());

    try {
      final response = await soldProductsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        SoldProductLoaded(
          products: List.from(products),
          hasMore: hasMore,
        ),
      );
    } on ApiException catch (e) {
      emit(SoldProductError(e.message));
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final currentState = state;

    if (currentState is SoldProductLoaded) {
      emit(
        SoldProductLoaded(
          products: currentState.products,
          hasMore: currentState.hasMore,
          isLoadingMore: true,
        ),
      );
    }

    try {
      currentPage++;

      final response = await soldProductsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        SoldProductLoaded(
          products: List.from(products),
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      // Don't lose the already loaded products.
      currentPage--;

      emit(
        SoldProductLoaded(
          products: List.from(products),
          hasMore: true,
          isLoadingMore: false,
        ),
      );

      // You could also add a separate pagination error state.
      print(e.message);
    } finally {
      isLoadingMore = false;
    }
  }
}