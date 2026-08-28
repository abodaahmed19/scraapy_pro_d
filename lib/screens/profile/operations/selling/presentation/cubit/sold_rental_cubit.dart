import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/entity/selling_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_rentals_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_rental_state.dart';

class SoldRentalCubit extends Cubit<SoldRentalState> {
  final SoldRentalsUseCase soldRentalsUseCase;

  SoldRentalCubit(this.soldRentalsUseCase)
      : super(SoldRentalInitial());

  int currentPage = 1;

  bool hasMore = true;
  bool isLoadingMore = false;

  final List<SellingOrderEntity> products = [];

  Future<void> getSoldRentals() async {
    if (isLoadingMore) return;

    currentPage = 1;
    hasMore = true;
    products.clear();

    emit(SoldRentalLoading());

    try {
      final response = await soldRentalsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        SoldRentalLoaded(
          products: List.from(products),
          hasMore: hasMore,
        ),
      );
    } on ApiException catch (e) {
      emit(SoldRentalError(e.message));
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final currentState = state;

    if (currentState is SoldRentalLoaded) {
      emit(
        SoldRentalLoaded(
          products: currentState.products,
          hasMore: currentState.hasMore,
          isLoadingMore: true,
        ),
      );
    }

    try {
      currentPage++;

      final response = await soldRentalsUseCase(currentPage);

      products.addAll(response.results);

      hasMore = response.next != null;

      emit(
        SoldRentalLoaded(
          products: List.from(products),
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      currentPage--;

      emit(
        SoldRentalLoaded(
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
