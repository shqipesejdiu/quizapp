import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
                  
Future <Questions> fetchQuestions() async {
  final response =  
    await http.get('http://localhost/quiz-app/public/api/v1/questions');
  if(response.statusCode == 200){
    return Questions.fromJson(json.decode(response.body));
  }else{
    throw Exception('Filed to load post');
  }
}

class Question{
  final String id;
  final String question;
  final List answers;
  final String category;

  Question({this.id, this.question, this.answers, this.category});

  factory Question.fromJsons(Map<String,dynamic> json){
    return Question(
      id: json['id'],
      question: json['question'],
      answers: json['answers'],
      category: json['category_id'],
    );
  }
  toJsonEncodable(){
    Map<String, dynamic> m = new Map();
    m['id'] =id;
    m['question'] =question;
    m['answers'] =answers;
    m['category'] =category;
    return m;
  }
}
class Questions{
  final List<Question> questions;

  Questions({this.questions});

  factory Questions.fromJson(List<dynamic> parsedJson){
    List<Question> questions = new List<Question>();
    questions = parsedJson.map((i) => Question.fromJsons(i)).toList();

    return new Questions(questions: questions);
  }
  toJsonEncodable(){
    return questions.map((question){
      return question.toJsonEncodable();
    }).toList();
  }
}