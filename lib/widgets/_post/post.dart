import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cdr_today/x/time.dart';
import 'package:cdr_today/navigations/args.dart';

class PostItem extends StatelessWidget {
  final ArticleArgs x;
  
  PostItem({ this.x });
  @override
  Widget build(BuildContext context) {
    List<dynamic> _json = jsonDecode(x.document);
    String title;
    for (var i in _json) {
      if (i['insert'].contains(new RegExp(r'\S'))) {
        title = i['insert'];
        break;
      }
    }
    
    return GestureDetector(
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
        subtitle: Container(
          child: Text(display(x.timestamp), style: TextStyle(fontSize: 11.0)),
          alignment:  AlignmentDirectional.bottomEnd
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0
        )
      ),
      onTap: () => Navigator.pushNamed(context, '/article', arguments: x),
    );
  }
}
