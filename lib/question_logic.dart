import 'package:simplequiz_app/question.dart';

class QuestionLogic {
  int _questionnumber = 0;
  List<Question> _questionlist = [
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
    Question('handphone', true),
  ];

  String getQuestion() => _questionlist[_questionnumber].question;

  int getQuestionNumberText() => _questionnumber + 1;

  int getTotalQuestionText() => _questionlist.length;

  bool getCorrectAnswer() => _questionlist[_questionnumber].answer;

  void nextquestion() {
    if (_questionnumber < _questionlist.length - 1) {
      _questionnumber++;
      print(_questionnumber);
    }
  }

  bool isFinish() {
    if (_questionnumber >= _questionlist.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() => _questionnumber = 0;
}
