import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/buying_rentals_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_rentals_state.dart';

class BuyingRentalsCubit extends Cubit<BuyingRentalsState> {
  final BuyingRentalsUseCase buyingRentalsUseCase;

  BuyingRentalsCubit(this.buyingRentalsUseCase)
      : super(BuyingRentalsInitial());

  int currentPage = 1;

  bool hasMore = true;
  bool isLoadingMore = false;

  final List<buyingOrderEntity> rentals = [];

  Future<void> getBuyingRentals() async {
    if (isLoadingMore) return;

    currentPage = 1;
    hasMore = true;
    rentals.clear();

    emit(BuyingRentalsLoading());

    try {
      final response = await buyingRentalsUseCase(currentPage);

      rentals.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BuyingRentalsLoaded(
          rentals: List.from(rentals),
          hasMore: hasMore,
        ),
      );
    } on ApiException catch (e) {
      emit(BuyingRentalsError(e.message));
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final currentState = state;

    if (currentState is BuyingRentalsLoaded) {
      emit(
        BuyingRentalsLoaded(
          rentals: currentState.rentals,
          hasMore: currentState.hasMore,
          isLoadingMore: true,
        ),
      );
    }

    try {
      currentPage++;

      final response = await buyingRentalsUseCase(currentPage);

      rentals.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BuyingRentalsLoaded(
          rentals: List.from(rentals),
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      currentPage--;

      emit(
        BuyingRentalsLoaded(
          rentals: List.from(rentals),
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
