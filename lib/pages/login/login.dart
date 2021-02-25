import 'package:ucondo_flutter/imports.dart';

class LoginModel {
  String login;
  String password;

  bool validate() {

    if(isEmpty(login)) {
      alert('Informe o e-mail da sua conta');
      return false;
    } else if (isEmpty(password) || password.length <= 5) {
      alert('Informe a sua senha');
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'LoginModel{login: $login, password: $password}';
  }
}