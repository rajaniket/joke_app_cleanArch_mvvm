// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  final String joke;
  const JokeEntity({
    required this.joke,
  });

  @override
  List<Object?> get props => [joke];
}
