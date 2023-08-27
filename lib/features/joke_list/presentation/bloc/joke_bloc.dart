import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/joke_model.dart';
import '../../data/repositories/joke_repository_impl.dart';
import 'joke_state.dart';

part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  Timer? timer;
  List<JokeModel> jokesList = [];

  JokeBloc() : super(const JokeState(jokesList: [])) {
    on<JokeEvent>((event, emit) {});
    on<JokeInitialize>((event, emit) {
      timer = Timer.periodic(
        const Duration(seconds: 5),
        (timer) {
          add(FetchJoke());
        },
      );
    });

    on<FetchJoke>((event, emit) async {
      await addJokes();
      emit(
        state.copyWith(jokesList: List.from(jokesList), isError: false),
      );
    });
  }

  Future<JokeModel> getJoke() async {
    try {
      JokeModel joke = await JokeApiService().getJoke();
      return joke;
    } catch (e) {
      return Future.error(e);
    }
  }

  addJokes() async {
    try {
      JokeModel joke = await getJoke();
      jokesList.add(joke);
      if (jokesList.length > 10) jokesList.removeAt(0);
    } catch (e) {}
  }
}
