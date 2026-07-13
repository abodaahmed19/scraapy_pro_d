//
//
// import 'package:scraapy_pro/screens/home/domain/entities/service_entity.dart';
// import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';
//
// abstract class ServiceState {}
//
// class ServiceInitial extends ServiceState {}
// class ServiceLoading extends ServiceState {}
// class ServiceLoaded extends ServiceState {
//   final ServiceResponseModel serviceResponseModel;
//   ServiceLoaded(this.serviceResponseModel);
// }
// class ServiceError extends ServiceState {
//   final String message;
//   ServiceError(this.message);
// }
import 'package:scraapy_pro/screens/home/domain/entities/service_entity.dart';

enum ServicesStatus { initial, loading, success, loadingMore, error }

class ServiceState {
  final List<ServiceItemModel> items;
  final String? next;
  final ServicesStatus status;
  final String? error;

  const ServiceState({
    this.items = const [],
    this.next,
    this.status = ServicesStatus.initial,
    this.error,
  });

  ServiceState copyWith({
    List<ServiceItemModel>? items,
    String? next,
    ServicesStatus? status,
    String? error,
  }) {
    return ServiceState(
      items: items ?? this.items,
      next: next ?? this.next,
      status: status ?? this.status,
      error: error,
    );
  }
}