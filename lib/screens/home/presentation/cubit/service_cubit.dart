import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/home/data/service_repositiry.dart';
import 'package:scraapy_pro/screens/home/presentation/cubit/service_state.dart';

class ServicesCubit extends Cubit<ServiceState> {
  final ServiceRepository repo;

  ServicesCubit(this.repo) : super(const ServiceState());

  /// 🔹 First Load
  Future<void> getServices(String type) async {
    emit(state.copyWith(status: ServicesStatus.loading));

    try {
      final response = await repo.getServices(type);

      emit(state.copyWith(
        status: ServicesStatus.success,
        items: response.results?.data ?? [],
        next: response.next,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ServicesStatus.error,
        error: e.toString(),
      ));
    }
  }

  /// 🔹 Pagination
  Future<void> loadMore(String type) async {
    if (state.next == null) return;
    if (state.status == ServicesStatus.loadingMore) return;

    emit(state.copyWith(status: ServicesStatus.loadingMore));

    try {
      final response = await repo.getServices(type);

      final newItems = response.results?.data ?? [];

      emit(state.copyWith(
        status: ServicesStatus.success,
        items: [...state.items, ...newItems], // 🔥 merge
        next: response.next,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ServicesStatus.error,
        error: e.toString(),
      ));
    }
  }
}