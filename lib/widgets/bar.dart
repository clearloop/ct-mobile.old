import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback action;

  DrawerBar({ this.icon, this.title, this.action });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[200], Colors.grey[50]]
            ),
          ),
          height: 32.0,
          padding: EdgeInsets.only(left: 16.0),
          alignment: Alignment.centerLeft,
        ),
        Spacer(),
        icon ?? SizedBox(
          child: IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              size: 20.0,
            ),
            color: Colors.grey[600],
            onPressed: action ?? null,
          ),
          height: 32.0,
        )
      ]
    );
  }
}
