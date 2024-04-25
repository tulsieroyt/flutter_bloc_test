import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/counter/bloc/counter_event.dart';
import 'package:flutter_bloc_test/counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInit()) {
    on<CounterIncrease>((event, emit) {
      counter = counter +1 ;
      emit(CounterUpdate(counter: counter));
    });

    on<CounterDecrease>((event, emit) {
      if (counter >= 1) {
        counter = counter -1;
      }
      emit(CounterUpdate(counter: counter));
    });
  }
}
