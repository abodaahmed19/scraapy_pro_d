abstract class DangerMainfestState {}

class DangerMainfestInitial extends DangerMainfestState {}

class DangerMainfestLoading extends DangerMainfestState {}

class DangerMainfestSuccess extends DangerMainfestState {}

class DangerMainfestError extends DangerMainfestState {
  final String message;
  DangerMainfestError(this.message);
}