import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, _) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              "Welcome Back,",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    "Name: ${user.displayName ?? "NA"}",
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Text("Email: ${user.email}"),
          ],
        ),
      );
    });
  }
}
