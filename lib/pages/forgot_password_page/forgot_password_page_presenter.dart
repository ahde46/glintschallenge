import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/services/auth_service.dart';

abstract class ForgotPasswordPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class ForgotPasswordPagePresenter
    extends BasePresenter<ForgotPasswordPageView> {
  AuthService _authService = AuthService();

  String email;

  Future<void> recoverPassword() async {
    if (view.formKey.currentState.validate()) {
      await _authService.resetPassword(email);
    }
  }
}
