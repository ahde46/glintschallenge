import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/home_page/home_page.dart';
import 'package:glistschallenge/pages/login_page/login_page.dart';
import 'package:glistschallenge/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Glints Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Consumer<User>(
          builder: (context, user, _) {
            if (user == null) {
              return LoginPage();
            } else {
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}
