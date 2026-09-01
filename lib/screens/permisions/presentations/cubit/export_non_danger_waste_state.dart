abstract class ExportNonDangerWasteState {}

class ExportNonDangerWasteInitial extends ExportNonDangerWasteState {}

class ExportNonDangerWasteLoading extends ExportNonDangerWasteState {}

class ExportNonDangerWasteSuccess extends ExportNonDangerWasteState {}

class ExportNonDangerWasteError extends ExportNonDangerWasteState {
  final String message;
  ExportNonDangerWasteError(this.message);
}