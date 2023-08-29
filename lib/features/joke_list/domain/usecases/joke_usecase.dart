import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';
import '../repository/joke_repository.dart';

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
  Future<DataState<List<JokeEntity>>> getJoke({required JokeParams params, required bool intialCall}) async {
    return await jokeRepository.getJoke(params: params, intialCall: intialCall);
  }
}
