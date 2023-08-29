import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/joke_bloc.dart';
import '../bloc/joke_state.dart';
import '../widgets/custom_list_tile.dart';

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
      appBar: AppBar(
        title: const Text(
          "Your Jokes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<JokeBloc, JokeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: !state.isLoading
                ? ListView.builder(
                    itemCount: state.jokesList.length,
                    itemBuilder: (context, index) {
                      Color color = index % 2 == 0 ? const Color(0xff9189EF) : const Color(0xffF4AAE8);
                      return CustomListTileWidget(
                        color: color,
                        count: index + 1,
                        joke: state.jokesList[index].joke,
                      );
                    },
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}
