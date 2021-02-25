import 'package:ucondo_flutter/imports.dart';

class ForgotPasswordModel {
  String email;

  bool validate() {
    if (isEmpty(email)) {
      alert('Informe seu e-mail');
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'SignUp{email: $email}';
  }
}
