class Validators {
  Validators._();

  static String? required(String? value, [String message = 'هذا الحقل مطلوب']) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value, [String message = 'أدخل بريد إلكتروني صحيح']) {
    final requiredError = required(value, 'هذا الحقل مطلوب');
    if (requiredError != null) {
      return requiredError;
    }
    final emailRegExp = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w{2,}$',
    );
    if (!emailRegExp.hasMatch(value!.trim())) {
      return message;
    }
    return null;
  }

  static String? phone(String? value, [String message = 'أدخل رقم هاتف صحيح']) {
    final requiredError = required(value, 'هذا الحقل مطلوب');
    if (requiredError != null) {
      return requiredError;
    }
    final phoneRegExp = RegExp(r'^[0-9]{7,15}$');
    if (!phoneRegExp.hasMatch(value!.trim())) {
      return message;
    }
    return null;
  }

  static String? minLength(
    String? value,
    int length, [
    String message = 'القيمة قصيرة جداً',
  ]) {
    final requiredError = required(value, 'هذا الحقل مطلوب');
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.trim().length < length) {
      return message;
    }
    return null;
  }

  static String? numeric(String? value, [String message = 'أدخل رقماً صحيحاً']) {
    final requiredError = required(value, 'هذا الحقل مطلوب');
    if (requiredError != null) {
      return requiredError;
    }
    if (double.tryParse(value!.trim()) == null) {
      return message;
    }
    return null;
  }
}
