import 'package:flutter/material.dart';

class Questions extends StatelessWidget{
  final String questionText;

  Questions(this.questionText);

  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            child: Text(
              questionText,
              style: TextStyle(
                fontSize: 28,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}