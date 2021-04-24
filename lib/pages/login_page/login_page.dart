import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/login_page/login_page_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageView {
  LoginPagePresenter _presenter = LoginPagePresenter();

  @override
  void initState() {
    _presenter.init(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }

  @override
  void rebuildPage() {
    if (mounted) setState(() {});
  }
}
