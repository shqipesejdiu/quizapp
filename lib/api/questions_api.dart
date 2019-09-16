import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
                  
Future <QuestionList> fetchQuestions() async {
  final response =  
    await http.get('https://my-json-server.typicode.com/shqipesejdiu/demo/questions');
  if(response.statusCode == 200){
    return QuestionList.fromJson(json.decode(response.body));
  }else{
    throw Exception('Filed to load post');
  }
}

class Question{
  final id;
  final question;
  final List answers;
  final category;

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
class QuestionList{
  final List<Question> questions;

  QuestionList({this.questions});

  factory QuestionList.fromJson(List<dynamic> parsedJson){
    List<Question> questions = new List<Question>();
    questions = parsedJson.map((i) => Question.fromJsons(i)).toList();

    return new QuestionList(questions: questions);
  }
  toJsonEncodable(){
    return questions.map((question){
      return question.toJsonEncodable();
    }).toList();
  }
}