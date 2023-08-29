import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

import '../usecases/joke_usecase.dart';

abstract class JokeRepository {
  Future<DataState<List<JokeEntity>>> getJoke({required JokeParams params, required bool intialCall});
}
