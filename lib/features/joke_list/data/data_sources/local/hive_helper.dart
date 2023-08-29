import 'package:hive/hive.dart';
import 'package:joke_app/features/joke_list/data/models/joke_model.dart';
import 'joke_local_datasource.dart';

class JokeHiveHelper extends JokeLocalDataSource {
  Future<Box<JokeModel>> _getBox() async {
    Box<JokeModel> box = await Hive.openBox<JokeModel>('joke');
    return box;
  }

  @override
  Future<List<JokeModel>> getJokes() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  addJoke({required JokeModel jokeModel}) async {
    final box = await _getBox();
    box.add(jokeModel);
  }

  @override
  removeJoke() async {
    final box = await _getBox();
    box.deleteAt(0);
  }
}
