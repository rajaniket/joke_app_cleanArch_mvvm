// this will wrap entire network call in the app
// There are two possible states of a network call ,Success or Fail
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  const DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required super.data});
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required super.error});
}
