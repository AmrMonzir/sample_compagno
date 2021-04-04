import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.onPress,
      required this.color,
      required this.text,
      required this.textStyle,
      this.leading,
      this.borderColor});

  final onPress;
  final Color color;
  final String text;
  final TextStyle textStyle;
  final Widget? leading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 200.0,
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leading ?? Container(),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
