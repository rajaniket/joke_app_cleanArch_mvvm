import 'dart:convert';

import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

class JokeModel extends JokeEntity {
  const JokeModel({required super.joke});

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      joke: map['joke'] as String,
    );
  }

  @override
  bool get stringify => true;
}
