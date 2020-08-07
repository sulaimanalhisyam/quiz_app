import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simplequiz_app/question_logic.dart';

QuestionLogic questionlogic = QuestionLogic();

void main() => runApp(simplequiz());

class simplequiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff3F51B5),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Quiz',
                style: TextStyle(
                    color: Colors.greenAccent, fontWeight: FontWeight.bold),
              ),
              Text(
                'App',
                style: TextStyle(
                    color: Colors.greenAccent, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreResult = [
    Text(
      'Hasil : ',
      style: TextStyle(color: Colors.white),
    )
  ];

  void checkAnswer(bool answer) {
    bool correctAnswer = questionlogic.getCorrectAnswer();

    setState(() {
      if (questionlogic.isFinish()) {
        Alert(
            context: context,
            type: AlertType.success,
            title: "Quiz Selesai",
            desc: "Main Ulang Quiz",
            buttons: [
              DialogButton(
                child: Text(
                  "Finish",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120.0,
              )
            ]).show();
        questionlogic.resetQuestion();
        scoreResult.clear();
      } else {
        if (answer = correctAnswer) {
          scoreResult.add(Icon(
            Icons.check,
            color: Colors.greenAccent,
          ));
        } else {
          scoreResult.add(Icon(
            Icons.close,
            color: Colors.redAccent,
          ));
        }

        questionlogic.nextquestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(children: scoreResult),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey),
              child: Text(
                  questionlogic.getQuestionNumberText().toString() +
                      '/' +
                      questionlogic.getTotalQuestionText().toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionlogic.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.redAccent,
                  child: Text(
                    'Salah!',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.greenAccent,
                  child: Text(
                    'Benar!',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
