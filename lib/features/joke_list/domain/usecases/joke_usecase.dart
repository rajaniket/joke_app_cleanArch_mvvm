// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

import '../repository/joke_repository.dart';

// to fecth data from repository

class JokeParams {
  final String path;
  JokeParams({
    required this.path,
  });
}

class JokeUsecase implements JokeRepository {
  final JokeRepository jokeRepository;
  JokeUsecase({
    required this.jokeRepository,
  });

  @override
  Future<DataState<List<JokeEntity>>> getJoke({required JokeParams params, bool intialCall = false}) async {
    return await jokeRepository.getJoke(params: params);
  }
}