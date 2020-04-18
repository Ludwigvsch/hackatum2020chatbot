import 'package:flutter/material.dart';

class Sidebar_item extends StatelessWidget {
  final String label;
  Function onPressed;
  

  Sidebar_item({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        height: 70,
        color: Colors.blue,
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(fontSize: 30),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
