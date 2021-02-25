import 'package:ucondo_flutter/imports.dart';

class AppTextStyle {
  // Text
  static Color textColor = Colors.white;
  static double textFontSize = 18.0;

  // Label
  static Color labelTextColor = Colors.black;
  static double labelFontSize = 18.0;

  // Hint
  static Color hintTextColor = Colors.white;
  static double hintFontSize = 18.0;

  static Color cursorColor = Colors.grey;

  // Fill
  static bool filled = false;
  static Color fillColor = Colors.transparent;

  // Bord
  static Color borderColor = Colors.grey;
  static Color enabledColor = Colors.grey;
  static Color focusBorderColor = Colors.grey;
  static double borderRadius = 0.0;

  //Padding
  static EdgeInsets contentPadding;
}

// ignore: must_be_immutable
class AppText extends StatefulWidget {
  final Key testKey;
  final String label;
  final String hint;

  Color textColor;
  double textFontSize;
  Color hintTextColor;
  double hintFontSize;
  Color cursorColor;

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final Function onChanged;
  final FormFieldSetter<String> onSaved;
  EdgeInsets contentPadding;
  final EdgeInsets padding;

  final Widget prefixIcon;
  final Widget suffixIcon;

  bool password;

  final bool passwordEye;

  double borderRadius;
  final int maxLines;
  final bool enabled;

  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;

  final String initialValue;
  final int errorMaxLines;
  final TextAlign textAlign;
  Color enabledColor;
  Color borderColor;
  Color focusBorderColor;
  bool filled;
  Color fillColor;

  AppText({
    this.label,
    this.hint,
    this.testKey,
    this.textColor,
    this.textFontSize,
    this.hintTextColor,
    this.hintFontSize,
    this.cursorColor,
    this.password = false,
    this.passwordEye = false,
    this.enabled = true,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputAction,
    this.focusNode,
    this.nextFocus,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.padding,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.initialValue,
    this.errorMaxLines,
    this.textAlign = TextAlign.start,
    this.borderRadius,
    this.borderColor,
    this.enabledColor,
    this.focusBorderColor,
    this.filled,
    this.fillColor
  }) {
    this.textColor ??= AppTextStyle.textColor;
    this.textFontSize ??= AppTextStyle.textFontSize;
    this.hintTextColor ??= AppTextStyle.hintTextColor;
    this.hintFontSize ??= AppTextStyle.hintFontSize;
    this.cursorColor ??= AppTextStyle.cursorColor;
    this.contentPadding ??= AppTextStyle.contentPadding;
    this.borderColor ??= AppTextStyle.borderColor;
    this.enabledColor ??= AppTextStyle.enabledColor;
    this.focusBorderColor ??= AppTextStyle.focusBorderColor;
    this.borderRadius ??= AppTextStyle.borderRadius;
    this.filled ??= AppTextStyle.filled;
    this.fillColor ??= AppTextStyle.fillColor;
  }

  @override
  _AppTextState createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: TextFormField(
        key: widget.testKey,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: widget.password,
        validator: widget.enabled ? widget.validator : null,
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        focusNode: widget.focusNode,
        onSaved: widget.onSaved,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor,
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.inputFormatters,
        onFieldSubmitted: (String text) {
          if (widget.nextFocus != null) {
            FocusScope.of(context).requestFocus(widget.nextFocus);
          }
        },
        style: TextStyle(
          fontSize: widget.textFontSize,
          color: widget.textColor,
        ),
        decoration: InputDecoration(
          errorMaxLines: widget.errorMaxLines,
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: widget.hintFontSize,
            color: widget.hintTextColor,
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: AppTextStyle.labelFontSize,
            color: AppTextStyle.labelTextColor,
          ),
          fillColor: widget.fillColor,
          filled: widget.filled,
          focusedBorder: _focusedBorder(),
          border: _border(),
          enabledBorder: _enabledBorder(),
          suffixIcon: widget.passwordEye
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.password = !widget.password;
                    });
                  },
                  child: new Icon(
                    widget.password ? Icons.visibility : Icons.visibility_off,
                    color: Color.fromRGBO(133, 133, 133, 1),
                    size: 30,
                  ),
                )
              : this.widget.suffixIcon,
          prefixIcon: this.widget.prefixIcon,
          contentPadding: widget.contentPadding,
        ),
      ),
    );
  }

  _border() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: widget.borderColor),
      borderRadius: BorderRadius.all(
        Radius.circular(this.widget.borderRadius),
      ),
    );
  }

  _enabledBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: widget.enabledColor),
      borderRadius: BorderRadius.all(
        Radius.circular(this.widget.borderRadius),
      ),
    );
  }

  _focusedBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: widget.focusBorderColor, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(this.widget.borderRadius),
      ),
    );
  }
}
