import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String name;
String gender;
String age;
String hometown;

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuestionTextField(
            value: name,
            labeltext: 'Name',
          ),
          QuestionTextField(
            value: gender,
            labeltext: 'Gender',
          ),
          QuestionTextField(
            value: age,
            labeltext: 'Age',
          ),
          QuestionTextField(
            value: hometown,
            labeltext: 'Hometown',
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text('Can you help older people?'),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: FlatButton(
          //         color: Colors.blue,
          //         onPressed: () {print('nice');},

          //       child: Text('Yes'),),
          //     ),

          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: FlatButton(
          //         color: Colors.blue,
          //         onPressed: () {print('bad');},
          //       child: Text('No')

          //       ),
          //     )
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    style: AlertStyle(
                        titleStyle: TextStyle(
                          color: Colors.white,
                        ),
                        descStyle: TextStyle(color: Colors.white)),
                    title: "THANK YOU",
                    desc: "for helping your community",
                    buttons: [
                      DialogButton(
                        color: Colors.blue,
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {Navigator.pop(context);Navigator.pop(context);},
                        width: 120,
                      )
                    ],
                  ).show();
                  
                },
                child: Text('Submit')),
          )
        ],
      )),
    );
  }
}

class QuestionTextField extends StatelessWidget {
  QuestionTextField({this.value, this.labeltext});

  final value;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: 300,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              value = value;
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
                labelText: labeltext,
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
    );
  }
}
