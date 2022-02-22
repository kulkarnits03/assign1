import 'auth widgets/signup.dart';
import 'package:flutter/material.dart';
import 'auth widgets/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
} //=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: login(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (_) => signup(),
      },
    );
  }
}
