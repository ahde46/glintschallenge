import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Function onPressed;

  LongButton({this.child, this.backgroundColor = Colors.blue, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            )),
        child: child,
        onPressed: onPressed != null ? () => onPressed() : null,
      ),
    );
  }
}
