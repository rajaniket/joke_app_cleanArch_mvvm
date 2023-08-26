import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:joke_app/domain/models/joke_model.dart';

class JokeApiService {
  Dio dio = Dio();

  Future<JokeModel> getJoke() async {
    try {
      var response = await dio.get("https://geek-jokes.sameerkumar.website/api?format=json");
      var contentType = response.headers["content-type"];

      if (response.statusCode == 200) {
        JokeModel joke = JokeModel.fromMap(json.decode(response.data));

        return joke;
      }
      return Future.error("Something went wrong");
    } catch (e) {
      return Future.error("Something went wrong");
    }
  }
}
