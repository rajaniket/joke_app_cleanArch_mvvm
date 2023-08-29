// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

class JokeState extends Equatable {
  final List<JokeEntity> jokesList;
  final String? error;
  final bool isError;
  final bool isLoading;
  const JokeState({
    required this.jokesList,
    this.error,
    this.isError = false,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [jokesList, isError, isLoading];

  JokeState copyWith({
    List<JokeEntity>? jokesList,
    String? error,
    bool? isError,
    bool? isLoading,
  }) {
    return JokeState(
      jokesList: jokesList ?? this.jokesList,
      error: error ?? this.error,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
