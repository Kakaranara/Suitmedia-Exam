part of 'reqres_cubit.dart';

@immutable
abstract class ReqresState {}

class ReqresInitial extends ReqresState {}

class ReqresLoaded extends ReqresState {
  final List<Reqres> data;
  final bool isListEmpty;

  ReqresLoaded({required this.data, this.isListEmpty = false});
}

class ReqresLoading extends ReqresState {
  final List<Reqres> oldData;

  ReqresLoading({required this.oldData});
}

class ReqresError extends ReqresState {
  String message;

  ReqresError({required this.message});
}
