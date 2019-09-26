import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> alertLoading(BuildContext context, {String text}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: text == null? Text('请求中...'): Text(text),
        content: Padding(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0)
        ),
      );
    },
  );
}

alert(
  BuildContext context, {
    String title, Text ok, Text cancel, VoidCallback action
  }
) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        actions: <Widget>[
          CupertinoDialogAction(
            child: cancel ?? Text('取消'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: ok ?? Text('确定'),
            onPressed: action ?? () => Navigator.pop(context),
          ),
        ],
        title: Text(title ?? ''),
      );
    },
  );
}
