enum RequestStatus { loading, success, failure }

class QoutesState {
  // final RequestStatus status;
  // final List data;
  final String selectedTab; // UI state (independent)
  final String? error;

  QoutesState({
    // required this.status,
    // required this.data,
    required this.selectedTab,
    this.error,
  });

  QoutesState copyWith({
    // RequestStatus? status,
    // List? data,
    String? selectedTab,
    String? error,
  }) {
    return QoutesState(
      // status: status ?? this.status,
      // data: data ?? this.data,
      selectedTab: selectedTab ?? this.selectedTab,
      error: error ?? this.error,
    );
  }
}