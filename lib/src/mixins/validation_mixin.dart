// import 'dart:collection';

mixin ValidationMixin {
  String validatePassword(value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 chracters mf';
    }
    return '';

    // return null;
  }

  validateEmail(value) {
    // this value is the input that we got(automatically assigned)
    // return null if valid
    // return error string otherwise
    if (!value!.contains('@')) {
      return 'Kripya theek mail bharen';
    }

    return null; // its implicit though
  }
}
