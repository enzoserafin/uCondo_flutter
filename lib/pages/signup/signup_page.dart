import 'package:ucondo_flutter/imports.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final viewModel = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onClickSignUp,
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: _body(),
      backgroundColor: AppColors.signup_background,
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _title(),
              _name(),
              _phone(),
              _email(),
              _newPassword(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return AppLabel(
      'Reazile Seu Cadastro',
      color: Colors.black,
      textAlign: TextAlign.center,
      padding: EdgeInsets.symmetric(vertical: 16),
    );
  }

  _name() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(
            'Nome',
            color: Colors.black,
            padding: EdgeInsets.zero,
          ),
          AppText(
            padding: EdgeInsets.only(bottom: 16),
            controller: viewModel.tName,
            nextFocus: viewModel.tFocusDdd,
            hint: 'Nome',
            textColor: Colors.black,
            hintTextColor: Colors.grey,
            onChanged: (s) {
              viewModel.model.name = s;
            },
          ),
        ],
      ),
    );
  }

  _phone() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(
            'Telefone',
            color: Colors.black,
          ),
          Row(
            children: [
              Expanded(
                flex: 15,
                child: AppText(
                  controller: viewModel.tDdd,
                  focusNode: viewModel.tFocusDdd,
                  nextFocus: viewModel.tFocusPhone,
                  padding: EdgeInsets.only(bottom: 16),
                  hint: 'DDD',
                  keyboardType: TextInputType.phone,
                  textColor: Colors.black,
                  hintTextColor: Colors.grey,
                  onChanged: (s) {
                    viewModel.model.ddd = s;
                  },
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 85,
                child: AppText(
                  controller: viewModel.tPhone,
                  focusNode: viewModel.tFocusPhone,
                  nextFocus: viewModel.tFocusEmail,
                  padding: EdgeInsets.only(bottom: 16),
                  hint: 'Número',
                  keyboardType: TextInputType.phone,
                  textColor: Colors.black,
                  hintTextColor: Colors.grey,
                  onChanged: (s) {
                    viewModel.model.phone = s;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _email() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(
            'E-mail',
            color: Colors.black,
          ),
          AppText(
            controller: viewModel.tEmail,
            focusNode: viewModel.tFocusEmail,
            nextFocus: viewModel.tFocusNewPassword,
            padding: EdgeInsets.only(bottom: 16),
            hint: 'E-mail',
            keyboardType: TextInputType.emailAddress,
            textColor: Colors.black,
            hintTextColor: Colors.grey,
            onChanged: (s) {
              viewModel.model.email = s;
            },
          ),
        ],
      ),
    );
  }

  _newPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(
            'Nova Senha',
            color: Colors.black,
          ),
          AppText(
            controller: viewModel.tNewPassword,
            focusNode: viewModel.tFocusNewPassword,
            padding: EdgeInsets.only(bottom: 32),
            hint: 'Nova Senha',
            password: true,
            passwordEye: true,
            textColor: Colors.black,
            hintTextColor: Colors.grey,
            onChanged: (s) {
              viewModel.model.newPassword = s;
            },
          ),
        ],
      ),
    );
  }

  void onClickSignUp() {
    bool signupOk = viewModel.model.validate();
    if (signupOk) {
      viewModel.signUp();
      pop();
    }
  }
}
