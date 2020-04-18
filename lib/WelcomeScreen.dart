import 'package:flutter/material.dart';
import 'package:hackatum2020chatbot/rounded_button.dart';
import 'package:hackatum2020chatbot/SigninScreen.dart';
import 'package:hackatum2020chatbot/SignupScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Civa',style: TextStyle(fontFamily: 'Shrikhand', fontSize: 25),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 360,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Your personal AI Bot',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.grey[300], fontSize: 20),
            // ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButtons(
              buttonColor: Colors.lightBlueAccent,
              label: 'Sign in',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              },
            ),
            RoundedButtons(
              buttonColor: Colors.lightBlueAccent,
              label: 'Sign up',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
