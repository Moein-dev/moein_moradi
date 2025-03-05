
import 'package:moein_moradi/core/models/error_handler.dart';

abstract class DataState<T> {
  final T? data;
  final ErrorModel? error;

  const DataState({
    this.data,
    this.error,
  });
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({
    required ErrorModel error,
  }) : super(
          data: null,
          error: error,
        );
}
