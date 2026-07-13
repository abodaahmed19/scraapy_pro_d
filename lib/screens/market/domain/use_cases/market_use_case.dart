import 'package:scraapy_pro/screens/market/data/repositories/market_repository.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';

class GetMarketsUseCase {
  final MarketRepository repository;

  GetMarketsUseCase(this.repository);

  Future<List<MarketItemEntity>> call() async {
    return await repository.getMarket();
  }
}

