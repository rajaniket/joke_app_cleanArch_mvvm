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
    try {
      final jokes = await jokeHiveHelper.getJokes();
      return jokes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  addJoke({required JokeModel jokeModel}) {
    jokeHiveHelper.addJoke(jokeModel: jokeModel);
  }

  @override
  removeJoke() {
    jokeHiveHelper.removeJoke();
  }
}
