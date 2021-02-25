import 'package:ucondo_flutter/imports.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main_purple,
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _logo(),
            _form(),
            _signinButton(),
            _signupButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _forgotPassword(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _logo() {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Image.asset(
        'assets/imgs/white_logo.png',
        width: 150,
        height: 150,
      ),
    );
  }

  _form() {
    return Column(
      children: [
        _loginForm(),
        _passwordForm(),
      ],
    );
  }

  _loginForm() {
    return AppText(
      controller: viewModel.tLogin,
      nextFocus: viewModel.tFocusPassword,
      onChanged: (s) {
        viewModel.model.login = s;
      },
      hint: 'E-mail',
      hintTextColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
    );
  }

  _passwordForm() {
    return AppText(
      controller: viewModel.tPassword,
      focusNode: viewModel.tFocusPassword,
      onChanged: (s) {
        viewModel.model.password = s;
      },
      hint: 'Senha',
      hintTextColor: Colors.white,
      password: true,
      passwordEye: true,
    );
  }

  _signinButton() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: AppButton(
        onPressed: onClickLogin,
        text: 'ENTRAR',
        stream: viewModel.button$.stream,
      ),
    );
  }

  _signupButton() {
    return Container(
      child: AppButton(
        onPressed: onClickSignUp,
        text: 'NÃO TENHO UMA CONTA',
      ),
    );
  }

  _forgotPassword() {
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: AppLabel(
        'Esqueci minha senha',
        onPressed: onClickForgotPassword,
      ),
    );
  }

  void onClickLogin() {
    bool loginOk = viewModel.model.validate();
    if (loginOk) {
      viewModel.login();
    }
  }

  onClickSignUp() => push(SignUpPage());

  onClickForgotPassword() => push(ForgotPasswordPage());
}
