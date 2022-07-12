import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_test/data/model/Reqres.dart';
import 'package:suitmedia_test/data/repository/reqres_repository.dart';

part 'reqres_state.dart';

class ReqresCubit extends Cubit<ReqresState> {
  ReqresCubit() : super(ReqresInitial());

  final _repo = ReqResRepository();
  int _page = 0;

  Future<void> getData() async {
    try {
      if (state is ReqresLoading) return;

      final currentState = state;
      List<Reqres> oldData = [];
      if (currentState is ReqresLoaded) {
        oldData = currentState.data;
      }

      emit(ReqresLoading(oldData: oldData));
      final List<Reqres> newData = await _repo.getPeopleData(page: _page);
      oldData.addAll(newData);
      emit(ReqresLoaded(data: oldData));
    } on SocketException catch (e) {
      emit(ReqresError(message: "Terjadi kesalahan pada koneksi internet"));
    } catch (e) {
      emit(ReqresError(message: "Terjadi masalah pada server."));
    }
  }
}
