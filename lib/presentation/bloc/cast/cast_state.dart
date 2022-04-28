part of 'cast_bloc.dart';

@immutable
abstract class CastState {}

class CastInitial extends CastState {}

class LoadingCast extends CastState {}

// ignore: must_be_immutable
class LoadedCast extends CastState {
  List<Cast> cast;
  LoadedCast({required this.cast});
}

// ignore: must_be_immutable
class ErrorLoadingCast extends CastState {
  String error;
  ErrorLoadingCast({required this.error});
}
