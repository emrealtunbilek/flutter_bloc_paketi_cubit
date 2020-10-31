import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sayac_event.dart';
part 'sayac_state.dart';

class SayacBloc extends Bloc<SayacEvent, SayacState> {
  SayacBloc() : super(SayacState(0));

  @override
  Stream<SayacState> mapEventToState(
    SayacEvent event,
  ) async* {
    if (event is Arttir) {
      yield SayacState(state.sayac + 1);
    } else {
      yield SayacState(state.sayac - 1);
    }
  }
}
