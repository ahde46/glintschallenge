import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/services/app_navigator.dart';
import 'package:glistschallenge/services/auth_service.dart';

abstract class SignUpPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class SignUpPagePresenter extends BasePresenter<SignUpPageView> {
  AuthService _authService = AuthService();

  String email;
  String password;
  String rePassword;

  Future<void> signUp() async {
    if (view.formKey.currentState.validate()) {
      User user =
          await _authService.registerWithEmailAndPassword(email, password);

      //if success then close the signup page
      if (user != null) {
        AppNavigator.back(context);
      }
    }
  }
}
