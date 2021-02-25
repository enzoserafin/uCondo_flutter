import 'package:flutter/cupertino.dart';
import 'package:ucondo_flutter/imports.dart';

class AppProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  final Color color;
  final bool isCenter;
  final double size;
  final double strokeWidth;

  const Progress({Key key, this.color, this.isCenter = true, this.size = 22, this.strokeWidth = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCenter
        ? Center(
            child: _progress(context),
          )
        : _progress(context);
  }

  _progress(BuildContext context) {
    bool ios = Theme.of(context).platform == TargetPlatform.iOS;
    return ios
        ? CupertinoActivityIndicator(radius: 10)
        : Container(
            height: this.size,
            width: this.size,
            child: CircularProgressIndicator(
              strokeWidth: this.strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? Theme.of(context).primaryColor,
              ),
            ),
          );
  }
}
