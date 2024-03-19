class Validators {
  static String? validateEmpty(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'Empty Value Required!';
    }
    return null;
  }

  static String? validatePassword(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'password is required!';
    } else if (value!.length < 6) {
      return message ?? 'password is too short!';
    }
    return null;
  }

  static String? validateEmail(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Email is not valid';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.["
            r"a-zA-Z]+")
        .hasMatch(value!)) {
      return message ?? 'Email is not valid';
    }
    return null;
  }

  static String? validatePhone(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Empty Value Required!';
    } else if (!RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]'
                r'{4,6}$)')
            .hasMatch(value!) ||
        value.length < 10) {
      return message ?? 'Wrong phone';
    }
    return null;
  }

  static String? validatePasswordConfirm(String? value, String? pass,
      {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Empty Value Required!';
    } else if (value != pass) {
      return message ?? 'confirm password';
    }
    return null;
  }

  static String? validateDropDown(dynamic value, {String? message}) {
    if (value == null) {
      return message ?? 'Empty Value Required!';
    }
    return null;
  }
}
