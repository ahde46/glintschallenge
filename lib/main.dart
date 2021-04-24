import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glints Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
