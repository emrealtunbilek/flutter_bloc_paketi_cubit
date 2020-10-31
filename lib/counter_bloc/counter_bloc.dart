import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterArttir) {
      yield CounterState(state.sayac + 1);
    }
    if (event is CounterAzalt) {
      yield CounterState(state.sayac - 1);
      //eğer o an sayac değeri 4 ise ekrana CounterState(3) döndürülür.
    }
  }
}
