import 'package:scraapy_pro/screens/quotes/domain/entities/quotes_list_model.dart';

abstract class QuotesListState {}

class QuotesListInitial extends QuotesListState {}

class QuotesListLoading extends QuotesListState {}

class QuotesListLoaded extends QuotesListState {
  final QuotesListModel response;
  QuotesListLoaded(this.response);
}

class QuotesListError extends QuotesListState {
  final String message;
  QuotesListError(this.message);
}
