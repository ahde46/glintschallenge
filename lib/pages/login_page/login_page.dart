import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/forgot_password_page/forgot_password_page.dart';
import 'package:glistschallenge/pages/login_page/login_page_presenter.dart';
import 'package:glistschallenge/pages/sign_up_page/sign_up_page.dart';
import 'package:glistschallenge/services/app_navigator.dart';
import 'package:glistschallenge/shared_widgets/buttons/long_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageView {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginPagePresenter _presenter = LoginPagePresenter();

  @override
  void initState() {
    _presenter.init(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          .unfocus(), //tap everywhere to unfocus
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        isDense: true,
                        icon: Icon(Icons.email),
                        hintText: "Email Address"),
                    onChanged: (String text) {
                      // widget.presenter.tempUser.email = text;
                    },
                    validator: (String text) {
                      if (text == null || text.isEmpty)
                        return 'Email is required';

                      if (!text.contains(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))
                        return 'Please enter a valid email';
                    },
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: InputDecoration(
                        isDense: true,
                        icon: Icon(Icons.lock),
                        hintText: "Password"),
                    onChanged: (String text) {
                      // widget.presenter.tempUser.email = text;
                    },
                    validator: (String text) {
                      if (text == null || text.length < 8)
                        return 'Password must be greater than 8 characters.';
                    },
                    onFieldSubmitted: (_) {
                      _presenter.login();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      onTap: () {
                        AppNavigator.cupertinoPush(
                            context, ForgotPasswordPage());
                      },
                    ),
                  ),
                  LongButton(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _presenter.login();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 60),
                    child: LongButton(
                      backgroundColor: Colors.grey[50],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/google_icon.png"),
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Are you a new User? "),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        onTap: () {
                          AppNavigator.cupertinoPush(context, SignUpPage());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void rebuildPage() {
    if (mounted) setState(() {});
  }
}
