import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';

abstract class ForgotPasswordPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class ForgotPasswordPagePresenter
    extends BasePresenter<ForgotPasswordPageView> {
  String email;

  Future<void> recoverPassword() async {
    if (view.formKey.currentState.validate()) {
      print("email $email");
    }
  }
}
