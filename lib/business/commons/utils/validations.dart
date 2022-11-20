class Validations {
  static String? validateTckn(String? tckn, String? errorMessage) {
    var isValid = isValidateTCKN(tckn);
    return isValid ? null : errorMessage ?? "TCKN Hatalı";
  }

  static bool isValidateTCKN(String? tckn) {
    if (tckn == null || tckn.length != 11 || int.parse(tckn[0]) == 0) {
      return false;
    } else {
      int tekler =
          int.parse(tckn[0]) + int.parse(tckn[2]) + int.parse(tckn[4]) + int.parse(tckn[6]) + int.parse(tckn[8]);

      int ciftler = int.parse(tckn[1]) + int.parse(tckn[3]) + int.parse(tckn[5]) + int.parse(tckn[7]);

      var kalan = ((tekler * 7) - (ciftler)) % 10;
      var sonHane = ((tekler + ciftler + int.parse(tckn[9])) % 10);

      if (kalan != int.parse(tckn[9])) {
        return false;
      }
      if (sonHane != int.parse(tckn[10])) {
        return false;
      }
    }
    return true;
  }

  static String? validatePhone(String? text, String? errorMessage) {
    String error = errorMessage ?? "Lütfen Bu alanı Doldurunuz.";
    if (text == null || text.isEmpty) {
      return error;
    }
    if (!text.startsWith('5')) {
      return error;
    }
    if (text.length < 10) {
      return error;
    }

    return null;
  }

  static String? validateIsNotEmpty(String? text, String? errorMessage) {
    if (text == null || text.isEmpty) {
      return errorMessage ?? "Lütfen Bu alanı Doldurunuz.";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    //var regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    // if (email == null || !regex.hasMatch(email.trim())) {
    //   return 'Lütfen geçerli bir E-posta adresi giriniz.';
    // }
    return null;
  }

  static String? validatePasswordsAreSame(String? pass, String? pass2, String? errorMessage) {
    if (pass == null || pass.isEmpty || pass2 == null || pass2.isEmpty || pass != pass2) {
      return errorMessage ?? "Şifrelerin aynı oldugundan emin olunuz";
    }
    return null;
  }
}
