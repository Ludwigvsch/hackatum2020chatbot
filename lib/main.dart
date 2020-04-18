import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackatum2020chatbot/dialog_flow.dart';
import 'package:hackatum2020chatbot/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
        // primarySwatch: Colors.green,
        // accentColor: Colors.green,
      
      home: WelcomeScreen(),
    );
    
  }
}
