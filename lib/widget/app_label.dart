import 'package:ucondo_flutter/imports.dart';

class AppLabelStyle {
  static double size = 16;
  static Color color = Colors.black;
}

// ignore: must_be_immutable
class AppLabel extends StatelessWidget {
  final Key testKey;
  final String text;
  double size;
  Color color;
  bool bold;
  bool underline;
  bool ellipsis;
  int maxLines;
  TextAlign textAlign;
  EdgeInsetsGeometry padding;
  Function onPressed;
  FontWeight fontWeight;
  FontStyle fontStyle;

  AppLabel(this.text, {
    this.testKey,
    this.size,
    this.color,
    this.bold = false,
    this.underline = false,
    this.ellipsis = false,
    this.maxLines,
    this.textAlign,
    this.padding,
    this.onPressed,
    this.fontWeight,
    this.fontStyle,
  }) {
    this.color ??= AppLabelStyle.color;
    this.size ??= AppLabelStyle.size;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        child: Text(
          text ?? "",
          key: this.testKey,
          overflow: ellipsis ? TextOverflow.ellipsis : null,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontStyle: fontStyle,
            fontWeight: bold
                ? FontWeight.bold
                : fontWeight != null ? fontWeight : FontWeight.normal,
            decoration: underline ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}