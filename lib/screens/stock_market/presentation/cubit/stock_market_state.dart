enum StockRequestStatus { loading, success, failure }

class StockMarketState {
  final StockRequestStatus status;
  final List data;
  final String selectedTab;
  final String? error;

  StockMarketState({
    required this.status,
    required this.data,
    required this.selectedTab,
    this.error,
  });

  StockMarketState copyWith({
    StockRequestStatus? status,
    List? data,
    String? selectedTab,
    String? error,
  }) {
    return StockMarketState(
      status: status ?? this.status,
      data: data ?? this.data,
      selectedTab: selectedTab ?? this.selectedTab,
      error: error ?? this.error,
    );
  }
}