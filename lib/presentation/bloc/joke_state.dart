// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:joke_app/domain/models/joke_model.dart';

class JokeState extends Equatable {
  final List<JokeModel> jokesList;
  final String? error;
  final bool isError;
  const JokeState({
    required this.jokesList,
    this.error,
    this.isError = false,
  });

  @override
  List<Object> get props => [jokesList, isError];

  JokeState copyWith({
    List<JokeModel>? jokesList,
    String? error,
    bool? isError,
  }) {
    return JokeState(
      jokesList: jokesList ?? this.jokesList,
      error: error ?? this.error,
      isError: isError ?? this.isError,
    );
  }
}
