abstract class ExportDangerWasteState {}

class ExportDangerWasteInitial extends ExportDangerWasteState {}

class ExportDangerWasteLoading extends ExportDangerWasteState {}

class ExportDangerWasteSuccess extends ExportDangerWasteState {}

class ExportDangerWasteError extends ExportDangerWasteState {
  final String message;
  ExportDangerWasteError(this.message);
}