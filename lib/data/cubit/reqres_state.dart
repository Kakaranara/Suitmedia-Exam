part of 'reqres_cubit.dart';

@immutable
abstract class ReqresState {}

class ReqresInitial extends ReqresState {}

class ReqresLoaded extends ReqresState {}

class ReqresLoading extends ReqresState {}

class ReqresError extends ReqresState {
  String message;

  ReqresError({required this.message});
}
