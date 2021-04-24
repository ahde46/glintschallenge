import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/pages/home_page/home_page.dart';
import 'package:glistschallenge/services/app_navigator.dart';

abstract class LoginPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class LoginPagePresenter extends BasePresenter<LoginPageView> {
  String email;
  String password;

  Future<void> login() async {
    // if (view.formKey.currentState.validate()) {
    //   print("email: $email");
    //   print("password: $password");
    // }
    AppNavigator.pushAndRemoveUntil(context, HomePage());
  }
}
