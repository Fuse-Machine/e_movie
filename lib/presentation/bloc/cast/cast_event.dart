part of 'cast_bloc.dart';

@immutable
abstract class CastEvent {}

// ignore: must_be_immutable
class FetchCast extends CastEvent {
  int id;
  FetchCast({required this.id});
}
