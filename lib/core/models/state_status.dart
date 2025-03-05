
import 'package:flutter/material.dart';
import 'package:moein_moradi/core/models/error_handler.dart';

@immutable
abstract class StateStatus<T> {
  final String? itemId;
  final T? data;
  final ErrorModel? message;

  const StateStatus({
    this.itemId,
    this.data,
    this.message,
  });
}

class StateLoading<T> extends StateStatus<T> {
  const StateLoading({super.itemId});
}

class StateLoadingComplete<T> extends StateStatus<T> {
  final String? loadingDescription;
  const StateLoadingComplete({
    super.itemId,
    this.loadingDescription,
  });
}

class StateCompleted<T> extends StateStatus<T> {
  const StateCompleted({required super.data});
}

class StateContinue<T> extends StateStatus<T> {
  const StateContinue({required super.data});
}

class StateReject<T> extends StateStatus<T> {
  const StateReject({super.message});
}

class StateLoadMore<T> extends StateStatus<T> {
  const StateLoadMore({super.data});
}

class StateNoData<T> extends StateCompleted<T> {
  const StateNoData({required super.data});
}

class StateInitial<T> extends StateStatus<T> {
  const StateInitial();
}

class StateError<T> extends StateStatus<T> {
  const StateError({super.message});
}
