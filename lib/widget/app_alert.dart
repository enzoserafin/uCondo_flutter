import 'package:ucondo_flutter/imports.dart';
import 'package:flutter/cupertino.dart';

Future alert(
  String msg, {
  String title,
  Function callback,
}) async {
  await showDialog(
    context: globalContext,
    barrierDismissible: false,
    builder: (context) {
      bool ios = Theme.of(context).platform == TargetPlatform.iOS;

      return WillPopScope(
        onWillPop: () async => false,
        child: ios
            ? CupertinoAlertDialog(
                title: Text(title ?? DialogStyles.title),
                content: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: <Widget>[
                      Text(msg ?? ""),
                    ],
                  ),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                      if (callback != null) {
                        callback();
                      }
                    },
                    child: Text(
                      "Confirma",
                      style: TextStyle(color: AppColors.main_purple),
                    ),
                  )
                ],
              )
            : AlertDialog(
                title: Text(title ?? DialogStyles.title, key: Key('dialogTitle')),
                content: Text(msg, key: Key('dialogMsg')),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "OK",
                      key: Key('dialogOk'),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (callback != null) {
                        callback();
                      }
                    },
                  )
                ],
              ),
      );
    },
  );
}

alertConfirm(
  String msg, {
  String title,
  String msgCancel = "Cancelar",
  String msgOk = "OK",
  Function callbackCancel,
  Function callbackOk,
}) {
  showDialog(
    context: globalContext,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: title != null ? Text(title) : null,
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text(
                msgCancel,
                key: Key(msgCancel),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (callbackCancel != null) {
                  callbackCancel();
                }
              },
            ),
            FlatButton(
              child: Text(
                msgOk,
                key: Key(msgOk),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (callbackOk != null) {
                  callbackOk();
                }
              },
            )
          ],
        ),
      );
    },
  );
}
