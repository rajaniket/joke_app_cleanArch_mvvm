// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/joke_usecase.dart';
import '../../models/joke_model.dart';
import 'hive_helper.dart';

abstract class JokeLocalDataSource {
  Future<List<JokeModel>> getJokes();
  addJoke({required JokeModel jokeModel});
  removeJoke();
}

class JokeLocalDataSourceImpl implements JokeLocalDataSource {
  final JokeHiveHelper jokeHiveHelper;
  JokeLocalDataSourceImpl({
    required this.jokeHiveHelper,
  });

  @override
  Future<List<JokeModel>> getJokes() async {
    final jokes = await jokeHiveHelper.getJokes();
    return jokes;
  }

  @override
  addJoke({required JokeModel jokeModel}) {
    jokeHiveHelper.addJoke(jokeModel: jokeModel);
  }

  @override
  removeJoke() {
    jokeHiveHelper.removeJoke();
    throw UnimplementedError();
  }
}
