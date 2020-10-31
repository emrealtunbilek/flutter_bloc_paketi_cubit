import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sayici_state.dart';

class SayiciCubit extends Cubit<SayiciState> {
  SayiciCubit() : super(SayiciState(0));

  void arttir() {
    emit(SayiciState(state._deger + 1));
  }

  void azalt() {
    emit(SayiciState(state._deger - 1));
  }
}
