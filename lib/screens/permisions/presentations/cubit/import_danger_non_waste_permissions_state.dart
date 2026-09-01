abstract class ImportDangerNonWastePermissionsState {}

class ImportDangerNonWasteInitial extends ImportDangerNonWastePermissionsState {}

class ImportDangerNonWasteLoading extends ImportDangerNonWastePermissionsState {}

class ImportDangerNonWasteSuccess extends ImportDangerNonWastePermissionsState {}

class ImportDangerNonWasteError extends ImportDangerNonWastePermissionsState {
  final String message;
  ImportDangerNonWasteError(this.message);
}