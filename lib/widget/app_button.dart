import 'package:ucondo_flutter/imports.dart';

class AppButtonStyle {
  static Color color = Colors.blue;
  static double height = 40;
  static double borderRadius = 0;
}

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final Key testKey;
  final String text;
  final Color textColor;
  final Function onPressed;
  final Stream<ButtonState> stream;
  double height;
  Color color;
  final EdgeInsetsGeometry padding;

  //https://dart.dev/tools/diagnostic-messages#non_constant_default_value
  AppButton({
    Key key,
    this.testKey,
    @required this.text,
    @required this.onPressed,
    this.textColor,
    this.color,
    this.stream,
    this.height,
    this.padding,
  }) : super(key: key) {
    this.color ??= AppButtonStyle.color;
    this.height ??= AppButtonStyle.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: stream != null
          ? StreamBuilder<ButtonState>(
        stream: this.stream,
        initialData: ButtonState(),
        builder: (context, snapshot) {
          ButtonState btState = snapshot.data;
          return _button(
            onPressed: btState.enabled ? this.onPressed : null,
            loading: btState.loading,
          );
        },
      )
          : _button(
        onPressed: onPressed == null ? null : onPressed,
      ),
    );
  }

  _button({
    Function onPressed,
    bool loading,
  }) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: loading == null || !loading ? onPressed : () {},
      child: Container(
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.grey[400] : this.color,
          borderRadius: BorderRadius.circular(AppButtonStyle.borderRadius,),
        ),
        alignment: Alignment.center,
        child: loading == null || !loading
            ? Text(
          this.text,
          key: this.testKey,
          style: TextStyle(
            color: textColor == null ? Colors.white : textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
            : Container(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        width: double.maxFinite,
        height: height,
      ),
    );
  }
}