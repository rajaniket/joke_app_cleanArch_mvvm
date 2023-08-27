import 'package:dio/dio.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';
import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/repository/joke_repository.dart';

import '../models/joke_model.dart';

// class JokeApiService {
//   Dio dio = Dio();

//   Future<JokeModel> getJoke() async {
//     try {
//       var response = await dio.get("https://geek-jokes.sameerkumar.website/api?format=json");
//       if (response.statusCode == 200) {
//         JokeModel joke = JokeModel.fromMap(response.data);
//         return joke;
//       }
//       return Future.error("Something went wrong");
//     } catch (e) {
//       return Future.error("Something went wrong");
//     }
//   }
// }

class JokeRepositoryImplementation implements JokeRepository {
  @override
  Future<DataState<JokeModel>> getJoke() {
    // returning JokeModel instead of JokeEntity , as JokeEntity only belongs to domain layer
    throw UnimplementedError();
  }
}
