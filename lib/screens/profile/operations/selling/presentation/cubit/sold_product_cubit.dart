import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/error/api_exception.dart';
import 'package:scraapy_pro/screens/notifications/domain/use_cases/notifications_use_case.dart';
import 'package:scraapy_pro/screens/notifications/presentation/cubit/notifications_state.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/domain/use_cases/sold_products_use_case.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_state.dart';

class SoldProductCubit extends Cubit<SoldProductState> {
  final SoldProductsUseCase soldProductsUseCase;

  SoldProductCubit(this.soldProductsUseCase) : super(SoldProductInitial());

  Future<void> getSoldProducts() async {
    emit(SoldProductLoading());

    try {
      final response = await soldProductsUseCase();
      emit(SoldProductLoaded(response));
    } on ApiException catch (e) {
      emit(SoldProductError(e.message));
    }
  }
}
