import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/screens/services/domain/use_cases/services_use_case.dart';
import 'package:scraapy_pro/screens/services/presentation/cubit/services_state.dart';



class ServicesCubit extends Cubit<ServicesState> {
  final GetServicesUseCase getServicesUseCase;

  ServicesCubit(this.getServicesUseCase) : super(ServicesInitial());

  Future<void> getServices() async {
    emit(ServicesLoading());

    try {
      final data = await getServicesUseCase();
      print(data.first);

      emit(ServicesLoaded(data));
    } catch (e) {
      print(e);
      emit(ServicesError(e.toString()));
    }
  }
}