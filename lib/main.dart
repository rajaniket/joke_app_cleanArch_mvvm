import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:joke_app/features/joke_list/data/data_sources/local/hive_helper.dart';
import 'package:joke_app/features/joke_list/data/data_sources/local/joke_local_datasource.dart';
import 'package:joke_app/features/joke_list/data/data_sources/remote/joke_remote_datasource.dart';
import 'package:joke_app/features/joke_list/data/repositories/joke_repository_impl.dart';
import 'package:joke_app/features/joke_list/domain/usecases/joke_usecase.dart';
import 'config/themes/app_theme.dart';
import 'features/joke_list/data/models/joke_model.dart';
import 'features/joke_list/presentation/bloc/joke_bloc.dart';
import 'features/joke_list/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JokeModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider<JokeBloc>(
        create: (context) => JokeBloc(
          usecase: JokeUsecase(
            jokeRepository: JokeRepositoryImpl(
              jokeLocalDataSource: JokeLocalDataSourceImpl(jokeHiveHelper: JokeHiveHelper()),
              jokeRemoteDataSource: JokeRemoteDataSourceImpl(dio: Dio()),
            ),
          ),
        ),
        child: const HomePage(),
      ),
    );
  }
}
