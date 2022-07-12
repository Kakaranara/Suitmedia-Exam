import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reqres_state.dart';

class ReqresCubit extends Cubit<ReqresState> {
  ReqresCubit() : super(ReqresInitial());
}
