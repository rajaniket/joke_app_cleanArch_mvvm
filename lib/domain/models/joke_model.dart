import 'dart:convert';

class JokeModel {
  final String joke;
  const JokeModel({
    required this.joke,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'joke': joke,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      joke: map['joke'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  bool get stringify => true;
}
