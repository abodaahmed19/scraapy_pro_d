abstract class ImportDangerWastePermissionsState {}

class ImportDangerWasteInitial extends ImportDangerWastePermissionsState {}

class ImportDangerWasteLoading extends ImportDangerWastePermissionsState {}

class ImportDangerWasteSuccess extends ImportDangerWastePermissionsState {}

class ImportDangerWasteError extends ImportDangerWastePermissionsState {
  final String message;
  ImportDangerWasteError(this.message);
}