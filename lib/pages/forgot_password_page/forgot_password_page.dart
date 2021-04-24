import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/forgot_password_page/forgot_password_page_presenter.dart';
import 'package:glistschallenge/shared_widgets/buttons/long_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    implements ForgotPasswordPageView {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgotPasswordPagePresenter _presenter = ForgotPasswordPagePresenter();

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
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      "Reset Password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      "Enter your email address and we’ll send you a recovery link.",
                      style: TextStyle(color: Colors.grey[500], fontSize: 22),
                    ),
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
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
                    onFieldSubmitted: (_) {
                      _presenter.recoverPassword();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: LongButton(
                      child: Text(
                        "Send Recovery Email",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _presenter.recoverPassword();
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
