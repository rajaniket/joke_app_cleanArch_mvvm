// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:joke_app/core/extensions/joke_extension.dart';
import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/data/data_sources/local/joke_local_datasource.dart';
import 'package:joke_app/features/joke_list/data/data_sources/remote/joke_remote_datasource.dart';
import 'package:joke_app/features/joke_list/domain/repository/joke_repository.dart';

import '../../domain/entities/joke.dart';
import '../../domain/usecases/joke_usecase.dart';
import '../models/joke_model.dart';

class JokeRepositoryImplementation implements JokeRepository {
  JokeLocalDataSource jokeLocalDataSource;
  JokeRemoteDataSource jokeRemoteDataSource;
  JokeRepositoryImplementation({
    required this.jokeLocalDataSource,
    required this.jokeRemoteDataSource,
  });

  @override
  Future<DataState<List<JokeEntity>>> getJoke({required JokeParams params, bool intialCall = false}) async {
    final jokes = await _getLocalJokes();
    if (intialCall && jokes.isNotEmpty) {
      return DataSuccess(data: jokes);
    } else {
      final outputJokes = await _fetchJokesAndAddToLocal(params: params);
      return DataSuccess(data: outputJokes);
    }
  }

  Future<List<JokeEntity>> _fetchJokesAndAddToLocal({required JokeParams params}) async {
    try {
      JokeModel joke = await jokeRemoteDataSource.getJoke(params: params);
      await _addToLocalJokes(joke: joke);
      final outputJokes = await _getLocalJokes();
      return outputJokes;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<JokeEntity>> _getLocalJokes() async {
    List<JokeModel> jokes = await jokeLocalDataSource.getJokes();
    return jokes.map((e) => e.toJokeEntity).toList();
  }

  Future<List<JokeEntity>> _addToLocalJokes({required JokeModel joke}) async {
    List<JokeEntity> jokes = await _getLocalJokes();
    if (jokes.length >= 10) jokeLocalDataSource.removeJoke();
    jokeLocalDataSource.addJoke(jokeModel: joke);
    return await _getLocalJokes();
  }
}
