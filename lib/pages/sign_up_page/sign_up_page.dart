import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/sign_up_page/sign_up_page_presenter.dart';
import 'package:glistschallenge/shared_widgets/buttons/long_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> implements SignUpPageView {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpPagePresenter _presenter = SignUpPagePresenter();

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
                      "Create Account",
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
                      _presenter.email = text;
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
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(
                        isDense: true,
                        icon: Icon(Icons.lock),
                        hintText: "Password"),
                    onChanged: (String text) {
                      _presenter.password = text;
                    },
                    validator: (String text) {
                      if (text == null || text.length < 8)
                        return 'Password must be greater than 8 characters.';
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
                        hintText: "Re-enter Password"),
                    onChanged: (String text) {
                      _presenter.rePassword = text;
                    },
                    validator: (String text) {
                      if (_presenter.password != text)
                        return 'Password doesn\'t match.';
                    },
                    onFieldSubmitted: (_) {
                      _presenter.signUp();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: LongButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _presenter.signUp();
                      },
                    ),
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
