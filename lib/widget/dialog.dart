import 'package:flutter/cupertino.dart';
import 'package:ucondo_flutter/imports.dart';

class DialogStyles {
  static String title = "";
}

Future showAlertDialog(
  String title,
  String content,
  Widget declineButton,
  Widget acceptButton, {
  bool barrierDismissible = true,
}) async {
  bool ios = Theme.of(globalContext).platform == TargetPlatform.iOS;

  await showDialog(
    barrierDismissible: barrierDismissible,
    context: globalContext,
    builder: (context) {
      return ios
          ? CupertinoAlertDialog(
              title: Text(title),
              content: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(content),
              ),
              actions: <Widget>[
                declineButton,
                acceptButton,
              ],
            )
          : AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                declineButton,
                acceptButton,
              ],
            );
    },
  );
}

Future showSimpleDialog(
  BuildContext context,
  String content, {
  String title,
  Function callBack,
  bool progress = false,
}) async {
  bool ios = Theme.of(context).platform == TargetPlatform.iOS;

  String label = title ?? DialogStyles.title;

  await showDialog(
    context: context,
    builder: (context) {
      return ios
          ? CupertinoAlertDialog(
              title: Text(label),
              content: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    Text(content),
                    progress ? SizedBox(height: 15) : SizedBox(),
                    progress ? Progress() : SizedBox(),
                  ],
                ),
              ),
              actions: <Widget>[
                !progress
                    ? CupertinoDialogAction(
                        onPressed: () {
                          if (callBack != null) {
                            callBack();
                          }
                          pop();
                        },
                        child: Text("OK"),
                      )
                    : Container(),
              ],
            )
          : AlertDialog(
              title: Text(label),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(content, textAlign: TextAlign.start),
                  progress ? SizedBox(height: 15) : SizedBox(),
                  progress ? Progress() : SizedBox(),
                ],
              ),
              actions: <Widget>[
                !progress
                    ? FlatButton(
                        onPressed: () {
                          if (callBack != null) {
                            callBack();
                          }
                          pop();
                        },
                        child: Text("OK"),
                      )
                    : Container(),
              ],
            );
    },
  );
}

Future loadingDialog(context, {String title, String msg}) async {
  bool ios = Theme.of(context).platform == TargetPlatform.iOS;

  String label = title ?? DialogStyles.title;

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return ios
          ? CupertinoAlertDialog(
              title: Text(label),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  msg != null ? Text(msg) : SizedBox(),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Progress(),
                  ),
                ],
              ),
            )
          : AlertDialog(
              title: Text(label),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  msg != null
                      ? Container(
                          child: Text(msg),
                          margin: EdgeInsets.only(right: 10),
                        )
                      : SizedBox(),
                  Container(
                    child: Progress(),
                    height: 40,
                  ),
                ],
              ),
            );
    },
  );
}

Future dialogConfirm(
  String msg, {
  @required Function callbackSim,
  @required Function callbackNao,
  String sim = "Sim",
  String nao = "Não",
  bool barrierDismissible = true,
  String title,
}) async {
  Widget declineButton;
  Widget acceptButton;

  bool ios = Theme.of(globalContext).platform == TargetPlatform.iOS;

  String label = title ?? DialogStyles.title;

  if (ios) {
    declineButton = CupertinoDialogAction(
      child: Text(nao),
      isDestructiveAction: true,
      onPressed: () async => await callbackNao(),
    );

    acceptButton = CupertinoDialogAction(
      child: Text(sim),
      onPressed: () async => await callbackSim(),
    );
  } else {
    declineButton = FlatButton(
      child: Text(nao),
      onPressed: () async => await callbackNao(),
    );

    acceptButton = FlatButton(
      child: Text(sim),
      onPressed: () async => await callbackSim(),
    );
  }

  return await showDialog(
    barrierDismissible: barrierDismissible,
    context: globalContext,
    builder: (context) {
      return ios
          ? CupertinoAlertDialog(
              title: Text(label),
              content: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(msg),
              ),
              actions: <Widget>[
                declineButton,
                acceptButton,
              ],
            )
          : AlertDialog(
              title: Text(label),
              content: Text(msg),
              actions: <Widget>[
                declineButton,
                acceptButton,
              ],
            );
    },
  );
}

Future showAppGeneralDialog(
  BuildContext context,
  Widget content, {
  EdgeInsets padding = const EdgeInsets.fromLTRB(16, 16, 16, 16),
}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dialog",
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (context, __, ___) {
      return Material(
        color: Colors.black12.withOpacity(0.6),
        child: SafeArea(
          child: Container(
            padding: padding,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: content,
            ),
          ),
        ),
      );
    },
  );
}

Future datePicker(
  BuildContext context, {
  DateTime firtsDate,
  DateTime lastDate,
  DateTime initialDate,
}) async {
  DateTime fd = firtsDate == null ? DateTime.now() : firtsDate;
  DateTime ld = lastDate == null ? DateTime.now().add(Duration(days: 365)) : lastDate;
  DateTime id = initialDate == null ? DateTime.now() : initialDate;

  return await showDatePicker(
    context: context,
    firstDate: fd,
    lastDate: ld,
    initialDate: id,
  );
}
