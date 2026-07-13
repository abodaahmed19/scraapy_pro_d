

import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';

abstract class MarketState {}

class MarketInitial extends MarketState {}
class MarketLoading extends MarketState {}
class MarketLoaded extends MarketState {
  final List<MarketItemEntity> markets;
  MarketLoaded(this.markets);
}
class MarketError extends MarketState {
  final String message;
  MarketError(this.message);
}