import 'package:ucondo_flutter/imports.dart';

class SignUpModel {
  String name;
  String ddd;
  String phone;
  String email;
  String newPassword;

  bool validate() {
    if (isEmpty(name)) {
      alert('Informe seu nome');
      return false;
    } else if (isEmpty(ddd) || isEmpty(phone)) {
      alert('Informe o seu telefone(DDD e número)');
      return false;
    } else if (ddd.length <= 1) {
      alert('DDD do telefone inválido)');
      return false;
    } else if (phone.length <= 7) {
      alert('Número do telefone inválido)');
      return false;
    } else if (isEmpty(email)) {
      alert('Informe seu e-mail');
      return false;
    } else if (isEmpty(newPassword) || newPassword.length <= 5) {
      alert('A senha deve possuir ao menos 6 caracteres');
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'SignUp{name: $name, ddd: $ddd, phone: $phone, email: $email, newPassword: $newPassword}';
  }
}
