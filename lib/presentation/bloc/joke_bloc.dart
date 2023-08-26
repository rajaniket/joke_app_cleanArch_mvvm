import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/data/repositories/get_data.dart';
import 'package:joke_app/presentation/bloc/joke_state.dart';

import '../../domain/models/joke_model.dart';
part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  Timer? timer;

  JokeBloc() : super(const JokeState(jokesList: [])) {
    on<JokeEvent>((event, emit) {});
    on<JokeInitialize>((event, emit) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          add(FetchJoke());
        },
      );
    });

    on<FetchJoke>((event, emit) async {
      try {
        JokeModel joke = await JokeApiService().getJoke();
        emit(
          state.copyWith(jokesList: List.from(state.jokesList)..add(joke), isError: false),
        );
      } catch (e) {
        emit(state.copyWith(error: "something went wrong", isError: true));
      }
    });
  }
}
