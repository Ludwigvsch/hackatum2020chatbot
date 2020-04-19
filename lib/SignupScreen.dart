import 'package:flutter/material.dart';

import 'package:hackatum2020chatbot/QuestionsScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    // helperStyle: ,
                    labelText: "Enter Email:",
                    labelStyle: TextStyle(color: Colors.white),
                    // labelStyle: kTyperTextStyle,
                    // hintStyle: kTyperTextStyle,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      // helperStyle: ,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      // labelStyle: kTyperTextStyle,
                      // hintStyle: kTyperTextStyle,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
              child: RaisedButton(
            onPressed: () async {
              // try {
              //   final newUser = await _auth.createUserWithEmailAndPassword(
              //       email: email, password: password);
              //   if (newUser != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsScreen(),
                      ));
              //   }
              // } catch (e) {
              //   _onAlertButtonPressed(context);
              // }
            },
            child: Text('Submit'),
          ))
        ],
      ),
    );
  }

  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(
          titleStyle: TextStyle(
            color: Colors.white,
          ),
          descStyle: TextStyle(color: Colors.white)),
      title: "Error",
      desc: "Try using another Email or Password.",
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
