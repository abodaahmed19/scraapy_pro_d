enum RequestStatus { loading, success, failure }

class HomeState {
  final RequestStatus status;
  final List data;
  final String selectedTab; // 👈 UI state (independent)
  final String? error;

  HomeState({
    required this.status,
    required this.data,
    required this.selectedTab,
    this.error,
  });

  HomeState copyWith({
    RequestStatus? status,
    List? data,
    String? selectedTab,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      selectedTab: selectedTab ?? this.selectedTab,
      error: error ?? this.error,
    );
  }
}