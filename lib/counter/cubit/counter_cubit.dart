import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/counter/cubit/counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  int counter = 0;

  CounterCubit() : super(CounterInitiate());

  void counterIncreased() {
    counter++;
    emit(CounterValueUpdated(counter: counter));
  }

  void counterDecreased() {
    if (counter >= 1) {
      counter--;
    }
    emit(CounterValueUpdated(counter: counter));
  }
}
