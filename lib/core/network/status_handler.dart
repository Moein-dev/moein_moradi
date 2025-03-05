

import 'package:moein_moradi/core/models/data_state.dart';
import 'package:moein_moradi/core/models/error_handler.dart';
import 'package:moein_moradi/core/models/state_status.dart';

class StatusHandler {
  static StateStatus<T> getStatus<T>(
    DataState<T> dataState, {
    Function(T data)? onSuccess,
    Function(ErrorModel data)? onError,
  }) {
    if (dataState is DataSuccess) {
      if (onSuccess != null) {
        onSuccess(dataState.data as T);
      }
      return StateCompleted<T>(data: dataState.data as T);
    } else {
      if (onError != null) {
        onError(dataState.error!);
      }
      return StateError<T>(message: dataState.error!);
    }
  }

  static void of<T>(
    StateStatus<T> status, {
    Function(T data)? onCompleted,
    Function(ErrorModel error)? onError,
    Function? onLoading,
    Function? onInitial,
  }) {
    if (status is StateCompleted && onCompleted != null) {
      onCompleted(status.data as T);
    }
    if (status is StateError && onError != null) {
      onError(status.message!);
    }
    if (status is StateLoading && onLoading != null) {
      onLoading();
    }
    if (status is StateInitial && onInitial != null) {
      onInitial();
    }
  }
}
