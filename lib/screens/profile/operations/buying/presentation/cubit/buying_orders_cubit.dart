import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/entity/buying_entity.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/domain/use_cases/buying_orders_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_orders_state.dart';

class BuyingOrdersCubit extends Cubit<BuyingOrdersState> {
  final BuyingOrdersUseCase buyingOrdersUseCase;

  BuyingOrdersCubit(this.buyingOrdersUseCase)
      : super(BuyingOrdersInitial());

  int currentPage = 1;

  bool hasMore = true;
  bool isLoadingMore = false;

  final List<buyingOrderEntity> orders = [];

  Future<void> getBuyingOrders() async {
    if (isLoadingMore) return;

    currentPage = 1;
    hasMore = true;
    orders.clear();

    emit(BuyingOrdersLoading());

    try {
      final response = await buyingOrdersUseCase(currentPage);

      orders.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BuyingOrdersLoaded(
          orders: List.from(orders),
          hasMore: hasMore,
        ),
      );
    } on ApiException catch (e) {
      emit(BuyingOrdersError(e.message));
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;

    final currentState = state;

    if (currentState is BuyingOrdersLoaded) {
      emit(
        BuyingOrdersLoaded(
          orders: currentState.orders,
          hasMore: currentState.hasMore,
          isLoadingMore: true,
        ),
      );
    }

    try {
      currentPage++;

      final response = await buyingOrdersUseCase(currentPage);

      orders.addAll(response.results);

      hasMore = response.next != null;

      emit(
        BuyingOrdersLoaded(
          orders: List.from(orders),
          hasMore: hasMore,
          isLoadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      currentPage--;

      emit(
        BuyingOrdersLoaded(
          orders: List.from(orders),
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
