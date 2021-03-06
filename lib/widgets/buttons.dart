import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cdr_today/x/_style/color.dart';

class CtNoRipple extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final Color color;
  final double size;
  CtNoRipple({ this.icon, this.onTap, this.padding, this.color, this.size });

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: GestureDetector(
        child: Icon(
          icon,
          size: size ?? 26.0,
          color: color ?? CtColors.primary
        ),
        onTap: onTap
      ),
      padding: padding ?? EdgeInsets.all(0.0)
    );
  }
}

class CtOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  CtOutlineButton({ this.text, this.onTap });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(
        text,
        style: TextStyle(color: CtColors.primary)
      ),
      onPressed: onTap,
      borderSide: BorderSide(color: CtColors.gray2),
      highlightColor: CtColors.gray5,
      highlightedBorderColor: CtColors.gray,
    );
  }
}

class CtBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CtNoRipple(
      icon: CupertinoIcons.back,
      onTap: () => Navigator.pop(context),
    );
  }
}

class CtClose extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  CtClose({ this.color, this.onTap });
  
  @override
  Widget build(BuildContext context) {
    return CtNoRipple(
      icon: CupertinoIcons.clear_circled,
      color: color,
      onTap: onTap ?? () => Navigator.maybePop(context),
    );
  }
}
