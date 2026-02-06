import 'package:cleanaerqg14/features/counter/domain/usecases/decrement_counter.dart';
import 'package:cleanaerqg14/features/counter/domain/usecases/get_counter.dart';
import 'package:cleanaerqg14/features/counter/domain/usecases/increment_counter.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_event.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;
  final GetCounter getCounter;

  CounterBloc({
    required this.incrementCounter,
    required this.decrementCounter,
    required this.getCounter,
  }) : super(const CounterState(value: 0)) {
    on<CounterStarted>(_onStarted);
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  Future<void> _onStarted(
    CounterStarted event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final counter = await getCounter();
      emit(state.copyWith(value: counter.value, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Error cargando contador"));
    }
  }

  Future<void> _onIncrement(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) async {
    print("INCREMENT EVENT LLEGO");
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final counter = await incrementCounter();
      emit(state.copyWith(value: counter.value, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Error incrementando"));
    }
  }

  Future<void> _onDecrement(
    CounterDecrementPressed event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final counter = await decrementCounter();
      emit(state.copyWith(value: counter.value, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Error decrementando"));
    }
  }
}
