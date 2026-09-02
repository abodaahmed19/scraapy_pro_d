


abstract class AddQuotationState {}

class QuotationInitial extends AddQuotationState {}
class QuotationsLoading extends AddQuotationState {
  final String serviceId;
  QuotationsLoading(this.serviceId);
}
class QuotationSuccess extends AddQuotationState {
  QuotationSuccess();
}
class QuotationError extends AddQuotationState {
  final String message;
  QuotationError(this.message);
}