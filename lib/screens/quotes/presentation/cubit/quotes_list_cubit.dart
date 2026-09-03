import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/quotes/domain/use_cases/quotes_list_use_case.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/quotes_list_state.dart';

class QuotesListCubit extends Cubit<QuotesListState> {
  final GetQuotesListUseCase getQuotesListUseCase;

  QuotesListCubit(this.getQuotesListUseCase) : super(QuotesListInitial());

  Future<void> getQuotesList() async {
    emit(QuotesListLoading());

    try {
      final response = await getQuotesListUseCase();
      print(response.products.totalPrice);
      print(response.services.totalPrice);
      print(response.rentals.totalPrice);
      print(response.grandTotal);
      print(response);
      emit(QuotesListLoaded(response));
    } catch (e) {
      print(e);
      emit(QuotesListError(e.toString()));
    }
  }
}
