import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hackatum2020chatbot/dialog_flow.dart';

final _auth = FirebaseAuth.instance;


class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
   String email;
  String password;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }
  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => FlutterFactsChatBot()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),

    body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 300,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
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
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Container(
                    width: 300,
                    child: TextField(
                      // obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue),
                          ),
                          // helperStyle: ,
                          labelText: "Enter Password:",
                          labelStyle: TextStyle(color: Colors.white),
                          // labelStyle: kTyperTextStyle,
                          // hintStyle: kTyperTextStyle,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                    ))),
            SizedBox(height: 10),
            Center(
                child: RaisedButton(
              onPressed: () async {
                // try {
                //   AuthResult result = await _auth.signInWithEmailAndPassword(
                //       email: email, password: password);
                //   FirebaseUser user = result.user;
                //   // return user.uid;
                //   if (user != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FlutterFactsChatBot()));
              //     }
              //   } catch (e) {
              //     _onAlertButtonPressed(context);
              //   }
              },
              child: Text('Submit'),
            ))
          ],
        ));
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