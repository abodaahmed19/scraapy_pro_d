// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:scraapy_pro/screens/services/domain/use_cases/add_quotation_use_case.dart';
// import 'package:scraapy_pro/screens/services/domain/use_cases/services_use_case.dart';
// import 'package:scraapy_pro/screens/services/presentation/cubit/add_quotation_state.dart';
//
//
//
// class AddQuotationCubit extends Cubit<AddQuotationState> {
//   final AddServicesQuotationUseCase addServicesQuotationUseCase;
//
//   AddQuotationCubit(this.addServicesQuotationUseCase) : super(QuotationInitial());
//
//   // A Map stores data as key → value pairs.
//   final Map<int, int> _quantities = {};
//
//   int quantityOf(int serviceId) => _quantities[serviceId] ?? 1;
//
//   void incrementQuantity(int serviceId) {
//     _quantities[serviceId] = quantityOf(serviceId) + 1;
//     emit(QuotationInitial());
//   }
//
//   void decrementQuantity(int serviceId) {
//     final q = quantityOf(serviceId);
//     if (q > 1) {
//       _quantities[serviceId] = q - 1;
//       emit(QuotationInitial());
//     }
//   }
//
//   Future<void> addQuotation(Map<String,dynamic> data) async {
//     emit(QuotationsLoading(data['id'].toString()));
//     try {
//       final response = await addServicesQuotationUseCase(data);
//
//       emit(QuotationSuccess());
//     } catch (e) {
//       emit(QuotationError(e.toString()));
//     }
//   }
// }