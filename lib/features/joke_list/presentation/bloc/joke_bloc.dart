import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/core/resources/data_state.dart';
import 'package:joke_app/features/joke_list/domain/entities/joke.dart';
import 'package:joke_app/features/joke_list/domain/usecases/joke_usecase.dart';
import 'joke_state.dart';
part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  Timer? timer;
  List<JokeEntity> jokesList = [];
  final JokeUsecase usecase;
  Duration updateDuration = const Duration(seconds: 60);

  JokeBloc({required this.usecase}) : super(const JokeState(jokesList: [])) {
    on<JokeEvent>((event, emit) {});
    on<JokeInitialize>((event, emit) async {
      emit(state.copyWith(jokesList: List.from(jokesList), isLoading: true));
      await _addJokes(intialCall: true);
      emit(state.copyWith(jokesList: List.from(jokesList), isLoading: false));
      timer = Timer.periodic(
        updateDuration,
        (timer) {
          add(FetchJoke());
        },
      );
    });

    on<FetchJoke>((event, emit) async {
      await _addJokes();
      emit(
        state.copyWith(jokesList: List.from(jokesList), isError: false),
      );
    });
  }

  Future _addJokes({bool intialCall = false}) async {
    final result = await usecase.getJoke(params: JokeParams(path: "/api?format=json"), intialCall: intialCall);
    if (result is DataSuccess) {
      jokesList = result.data!;
    }
  }
}
