import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
part 'joke_model.g.dart';

@HiveType(typeId: 0)
class JokeModel extends Equatable {
  @HiveField(0)
  final String joke;
  const JokeModel({required this.joke});

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      joke: map['joke'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [joke];
}
