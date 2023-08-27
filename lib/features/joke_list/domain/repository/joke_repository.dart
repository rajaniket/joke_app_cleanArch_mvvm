import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

abstract class JokeRepository {
  Future<DataState<JokeEntity>> getJoke();
}
