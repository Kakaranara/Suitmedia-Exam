import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_test/third.dart';

part 'name_state.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameState(nama: "Selected User Name"));

  void changeName({required String name}) {
    emit(NameState(nama: name));
  }
}
