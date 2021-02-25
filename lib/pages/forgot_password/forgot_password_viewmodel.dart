import 'package:ucondo_flutter/imports.dart';

class ForgotPasswordViewModel {
  final model = ForgotPasswordModel();

  //controllers
  final tEmail = TextEditingController();

  void RecoveryPassword() {
    print('Enviou a senha');
  }

  close() {
    tEmail.dispose();
  }
}
