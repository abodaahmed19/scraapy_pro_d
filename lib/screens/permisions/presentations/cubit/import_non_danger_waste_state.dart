abstract class ImportNonDangerWasteState {}

class ImportDangerNonWasteInitial extends ImportNonDangerWasteState {}

class ImportDangerNonWasteLoading extends ImportNonDangerWasteState {}

class ImportDangerNonWasteSuccess extends ImportNonDangerWasteState {}

class ImportDangerNonWasteError extends ImportNonDangerWasteState {
  final String message;
  ImportDangerNonWasteError(this.message);
}