import 'package:joke_app/features/joke_list/data/models/joke_model.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';

extension JokeModelExtension on JokeModel {
  JokeEntity get toJokeEntity => JokeEntity(joke: joke);
}
