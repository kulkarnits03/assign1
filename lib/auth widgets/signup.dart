// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/movie.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
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
            decoration: InputDecoration(labelText: "Email"),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              _email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Passowrd"),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              _password = value;
            },
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton.icon(
              onPressed: () async {
                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  if (newuser != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => moviehome(),
                        ));
                  }
                } catch (e) {
                  print(e);
                }
              },
              icon: Icon(Icons.arrow_right_alt),
              label: Text("SignUp")),
        ],
      ),
    ));
  }
}
