import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppDialog {
  static confirmationDialog(BuildContext context, String content,
      {@required Function onConfirm}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> toast(String message) async {
    return Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 13.5);
  }
}
