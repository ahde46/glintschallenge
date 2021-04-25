import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/services/auth_service.dart';

abstract class LoginPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class LoginPagePresenter extends BasePresenter<LoginPageView> {
  AuthService _authService = AuthService();
  String email;
  String password;

  Future<void> loginWithEmail() async {
    if (view.formKey.currentState.validate()) {
      await _authService.signInWithEmailPassword(email, password);
    }
  }

  Future<void> loginWithGoogle() async {
    await _authService.signInWithGoogle();
  }
}
