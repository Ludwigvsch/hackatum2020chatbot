import 'package:flutter/material.dart';
import 'package:hackatum2020chatbot/rounded_button.dart';
import 'package:hackatum2020chatbot/SigninScreen.dart';
import 'package:hackatum2020chatbot/SignupScreen.dart';
import 'package:hackatum2020chatbot/dialog_flow.dart';
import 'QuestionsScreen.dart';
class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Welcome to Civa',
          style: TextStyle(fontFamily: 'Shrikhand', fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                // SizedBox(height: 20),
                Text(
                  'Covid Intelligent Virtual Assistant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                // SizedBox(
                //   height: 48.0,
                // ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedButtons(
                        buttonColor: Colors.lightBlueAccent,
                        label: 'Start chatting',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FlutterFactsChatBot()));
                        },
                      ),
                      RoundedButtons(
                        buttonColor: Colors.lightBlueAccent,
                        label: 'Sign up for volunteering',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionsScreen()));
                        },
                      ),
                      SizedBox(height:10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
