import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/joke_bloc.dart';
import '../bloc/joke_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<JokeBloc>(context).add(JokeInitialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 192, 217, 246),
      appBar: AppBar(
        title: const Text("Your Joke"),
      ),
      body: BlocConsumer<JokeBloc, JokeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Align(
            alignment: Alignment.topCenter,
            child: !state.isError
                ? ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: state.jokesList.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        state.jokesList[index].joke,
                      ),
                    ),
                  )
                : Text(state.error ?? ""),
          );
        },
      ),
    );
  }
}
