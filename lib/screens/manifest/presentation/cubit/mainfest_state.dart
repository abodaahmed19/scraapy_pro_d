abstract class MainfestState {}

class MainfestInitial extends MainfestState {}

class MainfestLoading extends MainfestState {}

class MainfestSuccess extends MainfestState {}

class MainfestError extends MainfestState {
  final String message;
  MainfestError(this.message);
}