// import 'package:equatable/equatable.dart';
// import 'package:scraapypro/src/core/extensions/error_handler_extension.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../base_state.dart';
//
// part 'async_state.dart';
//
// abstract class AsyncCubit<T> extends Cubit<AsyncState<T>> {
//   AsyncCubit(T initialData) : super(AsyncState.initial(data: initialData));
//
//   void setLoading() {
//     emit(state.loading());
//   }
//
//   void setSuccess({required T data}) {
//     emit(state.success(data: data));
//   }
//
//   void setError({String? errorMessage}) {
//     emit(state.error(errorMessage: errorMessage));
//   }
//
//   void reset() {
//     emit(AsyncState.initial(data: state.data));
//   }
//
//   void updateData(T data) {
//     emit(state.copyWith(data: data));
//   }
//
//   void updateErrorMessage(String? errorMessage) {
//     emit(state.copyWith(errorMessage: errorMessage));
//   }
//
//   bool get isLoading => state.isLoading;
//
//   Future<void> executeAsync({
//     required Future<T> Function() operation,
//     Function(T)? successEmitter,
//   }) async {
//     setLoading();
//     await operation().runSafely(onSuccess: (result) {
//       if (successEmitter != null) {
//         successEmitter(result);
//       } else {
//         setSuccess(data: result);
//       }
//     }, onError: (error) {
//       setError(errorMessage: error.toString());
//     });
//   }
//
//   @override
//   void emit(AsyncState<T> state) {
//     if (isClosed) return;
//     super.emit(state);
//   }
// }
