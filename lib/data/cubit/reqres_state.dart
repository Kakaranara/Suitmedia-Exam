part of 'reqres_cubit.dart';

@immutable
abstract class ReqresState {}

class ReqresInitial extends ReqresState {}

class ReqresLoaded extends ReqresState {
  final List<Reqres> data;

  ReqresLoaded({required this.data});
}

class ReqresLoading extends ReqresState {
  final List<Reqres> oldData;

  ReqresLoading({required this.oldData});
}

class ReqresError extends ReqresState {
  String message;

  ReqresError({required this.message});
}
