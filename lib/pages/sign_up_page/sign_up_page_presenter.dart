import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';

abstract class SignUpPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class SignUpPagePresenter extends BasePresenter<SignUpPageView> {
  String email;
  String password;
  String rePassword;

  Future<void> signUp() async {
    if (view.formKey.currentState.validate()) {
      print("email: $email");
      print("password: $password");
      print("rePassword: $rePassword");
    }
  }
}
