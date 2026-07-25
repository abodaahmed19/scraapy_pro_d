/// Keys aligned with legacy `UserSecureStorage` / Scraapy app.
abstract final class SessionStorageKeys {
  static const version = 'version';
  static const lang = 'lang';
  static const userType = 'userType';
  static const token = 'token';
  static const expiry = 'expiry';
  static const name = 'name';
  static const id = 'id';
  static const email = 'email';
  static const contactNumber = 'contactNumber';
  static const image = 'image';
  static const inviteCode = 'inviteCode';

  /// Minimum stored version; below this we wipe secure storage (legacy behavior).
  static const minSupportedVersion = 1.52;
}
