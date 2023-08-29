//
import 'package:dio/dio.dart';

import 'package:joke_app/core/constants/constants.dart';
import 'package:joke_app/features/joke_list/data/models/joke_model.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../domain/usecases/joke_usecase.dart';

abstract class JokeRemoteDataSource {
  Future<JokeModel> getJoke({required JokeParams params});
}

class JokeRemoteDataSourceImpl implements JokeRemoteDataSource {
  final Dio dio;
  JokeRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<JokeModel> getJoke({required JokeParams params}) async {
    try {
      var response = await dio.get(jokeAPIBaseURL + params.path);
      switch (response.statusCode) {
        case 200:
          final result = JokeModel.fromMap(response.data);
          return result;
        case 400:
          throw ServerException(message: 'Bad Request');
        case 401:
          throw ServerException(message: 'Unathorized');
        case 500:
          throw ServerException(message: 'Internal Server Error');
        default:
          throw ServerException(message: 'Error');
      }
    } on TypeError catch (_) {
      throw CastException(message: 'Cast Error');
    } on UnsupportedError catch (_) {
      throw ServerException(message: 'Server Error');
    } catch (e) {
      rethrow;
    }
  }
}

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
