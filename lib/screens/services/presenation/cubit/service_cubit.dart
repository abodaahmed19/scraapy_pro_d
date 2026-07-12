import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/services/presenation/cubit/service_state.dart';

import '../../doman/use_cases/service_use_case.dart';


class ServiceCubit extends Cubit<ServiceState> {
  final GetServicesUseCase getServicesUseCase;

  ServiceCubit(this.getServicesUseCase) : super(ServiceInitial());

  Future<void> getServices() async {
    emit(ServiceLoading());

    try {
      final data = await getServicesUseCase();
      emit(ServiceLoaded(data));
    } catch (e) {
      emit(ServiceError(e.toString()));
    }
  }
}