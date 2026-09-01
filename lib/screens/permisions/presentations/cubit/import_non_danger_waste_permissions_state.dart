abstract class ImportNonDangerWastePermissionsState {}

class ImportDangerNonWasteInitial extends ImportNonDangerWastePermissionsState {}

class ImportDangerNonWasteLoading extends ImportNonDangerWastePermissionsState {}

class ImportDangerNonWasteSuccess extends ImportNonDangerWastePermissionsState {}

class ImportDangerNonWasteError extends ImportNonDangerWastePermissionsState {
  final String message;
  ImportDangerNonWasteError(this.message);
}