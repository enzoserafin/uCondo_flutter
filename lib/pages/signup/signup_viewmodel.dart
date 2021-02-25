import 'package:ucondo_flutter/imports.dart';

class SignupViewModel {
  final model = SignUpModel();

  //controllers
  final tName = TextEditingController();
  final tDdd = TextEditingController();
  final tPhone = TextEditingController();
  final tEmail = TextEditingController();
  final tNewPassword = TextEditingController();

  //Focus
  final tFocusDdd = FocusNode();
  final tFocusPhone = FocusNode();
  final tFocusEmail = FocusNode();
  final tFocusNewPassword = FocusNode();

  void signUp() {
    print('cadastrou');
    // alert('Cadastro realizado com sucesso');
  }

  close() {
    tName.dispose();
    tDdd.dispose();
    tPhone.dispose();
    tEmail.dispose();
    tNewPassword.dispose();
  }
}
