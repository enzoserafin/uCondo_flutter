import 'package:ucondo_flutter/imports.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {

  final viewModel = ForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onClickRecoveryPassword,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _email(),
          ],
        ),
      ),
    );
  }

  _email() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(
            'E-mail',
            color: Colors.black,
          ),
          AppText(
            controller: viewModel.tEmail,
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

  void onClickRecoveryPassword() {
    bool RecoveryPasswordOk = viewModel.model.validate();
    if (RecoveryPasswordOk) {
      viewModel.RecoveryPassword();
      pop();
    }
  }
}
