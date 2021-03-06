import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cdr_today/widgets/avoid.dart';

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

load(BuildContext context, String content) {
  return showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        child: CupertinoAlertDialog(
          title: Text(content ?? ''),
          content: Padding(
            child: CupertinoActivityIndicator(),
            padding: EdgeInsets.only(top: 15.0)
          ),
        ),
        onTap: () {
          Navigator.maybePop(context);
        }
      );
    }
  );
}

info(BuildContext context, String content) {
  return showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Padding(
          child: Text(
            content ?? '',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              letterSpacing: 1.0,
              height: 1.3,
              fontWeight: FontWeight.bold
            ),
          ),
          padding: EdgeInsets.only(top: 3.0)
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('确定'),
            onPressed: () => Navigator.pop(context),
          ),
        ]
      );
    }
  );
}

alert(
  BuildContext context, {
    String title, String content, Text ok, Text cancel, VoidCallback action
  }
) async {
  return showCupertinoDialog<void>(
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
        content: content == null ? null : Padding(
          child: Text(
            content ?? '',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              letterSpacing: 1.0,
              height: 1.3,
            )
          ),
          padding: EdgeInsets.only(top: 3.0)
        )
      );
    },
  );
}

alertInput(
  BuildContext context, {
    String title, Widget content, Text ok, Text cancel, VoidCallback action
  }
) async {
  return showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return KeyboardAvoiding(
        child: CupertinoAlertDialog(
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
          content: Padding(
            child: content,
            padding: EdgeInsets.only(top: 6.0)
          )
        ),
        kFactor: 0.3
      );
    }
  );
}
