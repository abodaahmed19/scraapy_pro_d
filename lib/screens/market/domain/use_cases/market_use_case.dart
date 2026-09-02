import 'package:scraapy_pro/screens/market/data/repositories/market_repository.dart';
import 'package:scraapy_pro/screens/services/domain/entities/services_entity.dart';

class GetMarketsUseCase {
  final MarketRepository repository;

  GetMarketsUseCase(this.repository);

  Future<ServicesEntity> call() async {
    return await repository.getMarket();
  }
}

