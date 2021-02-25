import 'package:ucondo_flutter/imports.dart';

class LoginViewModel {
  final model = LoginModel();

  //controllers
  final tLogin = TextEditingController();
  final tPassword = TextEditingController();

  //Focus
  final tFocusPassword = FocusNode();

  //Stream
  final button$ = ButtonStream();

  void init() {
    button$.setEnabled(true);
  }



  void login() {
    button$.setLoading(true);
    Future.delayed(Duration(milliseconds: 500), () {
      return print(model);
    });
    button$.setLoading(false);
  }

  close() {
    tLogin.dispose();
    tPassword.dispose();
    tFocusPassword.dispose();
    button$.close();
  }
}
