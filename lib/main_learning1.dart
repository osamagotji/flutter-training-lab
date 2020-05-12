import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  String _answerText = "False";
  bool _isCorrect = false;
  onPressedPrayut() {
    print("Prayut is my dad");
    setState(() {
      _answerText = "False";
      _isCorrect = false;
    });
  }

  void onPressedTaksin() {
    print("Taksin is my Dad");
    setState(() {
      _questionIndex += 1;
      _answerText = "True";
      _isCorrect = true;
    });
    print("Index = $_questionIndex");
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["Who is your dad ?", "Who is your mom ?"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GoTSaMa First App'),
        ),
        body: Column(children: <Widget>[
          Questions(questions[_questionIndex % 2]),
          RaisedButton(
            child: Text("Justin Beiber"),
            onPressed: () {
              print("I'm clicking at Justin Bieber");
              setState(() {
                _answerText = "False";
                _isCorrect = false;
              });
            },
          ),
          RaisedButton(
            child: Text("Prayut Chan-O-Cha"),
            onPressed: onPressedPrayut, // normal function
          ),
          RaisedButton(
            child: Text("Taksin Chinawatra"),
            onPressed: onPressedTaksin,
          ),
          RaisedButton(
            child: Text("WTF"),
            onPressed: () {
              print("WTF is clicking ?");
              setState(() {
                _answerText = "False";
                _isCorrect = false;
              });
            },
          ),
          _isCorrect ? Questions(_answerText) : Text(_answerText),
        ]),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Text('ssss')
//     );
//   }
// }
