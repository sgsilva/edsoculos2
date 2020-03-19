import 'package:flutter/material.dart';

class Questoes {
  String question;
  List<String> options;
  String answer;
 // bool escolhido =false;

  Questoes(dynamic question, dynamic options, dynamic answer) {
    this.question = question;
    this.options = options;
    this.answer = answer;
  }
  Questoes.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].map((option) {return option;}).toList().cast<String>();
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['options'] = this.options;
    data['answer'] = this.answer;
    return data;
  }
}

