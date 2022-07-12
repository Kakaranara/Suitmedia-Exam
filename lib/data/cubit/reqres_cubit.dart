import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_test/data/model/Reqres.dart';
import 'package:suitmedia_test/data/repository/reqres_repository.dart';

part 'reqres_state.dart';

class ReqresCubit extends Cubit<ReqresState> {
  ReqresCubit() : super(ReqresInitial());

  final _repo = ReqResRepository();
  int _page = 1;

  Future<void> getData() async {
    try {
      print("page : $_page");
      if (state is ReqresLoading) return;

      final currentState = state;
      List<Reqres> oldData = [];
      if (currentState is ReqresLoaded) {
        oldData = currentState.data;
      }
      emit(ReqresLoading(oldData: oldData));
      final List<Reqres> newData = await _repo.getPeopleData(page: _page);

      if (newData.isEmpty) {
        emit(ReqresLoaded(data: oldData, isListEmpty: true));
      } else {
        oldData.addAll(newData);
        _page++;
        emit(ReqresLoaded(data: oldData));
      }
    } on SocketException catch (e) {
      emit(ReqresError(message: "Terjadi kesalahan pada koneksi internet"));
    } catch (e) {
      emit(ReqresError(message: "Terjadi masalah pada server."));
    }
  }

  ///this func is made because
  Future<void> getInitialData() async {
    await getData();
    await getData();
  }

  void refresh() {
    _page = 1;
    emit(ReqresInitial());
  }
}
