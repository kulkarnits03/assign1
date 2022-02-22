// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/movie.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/backg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Email",
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                alignLabelWithHint: true),
            onChanged: (value) {
              _email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Passowrd",
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                alignLabelWithHint: true),
            onChanged: (value) {
              _password = value;
            },
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton.icon(
              color: Colors.blue[100],
              onPressed: () async {
                try {
                  final user = _auth
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((user) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => moviehome(),
                          )));
                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(Icons.arrow_right_alt),
              label: Text("LogIn")),
          SizedBox(
            height: 10,
          ),
          FlatButton.icon(
              color: Colors.blue[100],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => moviehome(),
                    ));
              },
              icon: Icon(Icons.arrow_right_alt),
              label: Text("SignUp")),
        ],
      ),
    ));
  }
}
