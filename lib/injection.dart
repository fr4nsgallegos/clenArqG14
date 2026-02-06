import 'package:cleanaerqg14/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:cleanaerqg14/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:cleanaerqg14/features/counter/domain/usecases/decrement_counter.dart';
import 'package:cleanaerqg14/features/counter/domain/usecases/get_counter.dart';
import 'package:cleanaerqg14/features/counter/domain/usecases/increment_counter.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_bloc.dart';

class Injection {
  // DATA
  static final counterLocal = CounterLocalDatasource();
  static final counterRepo = CounterRepositoryImpl(counterLocal);
  static final getCounter = GetCounter(counterRepo);
  // DOMAIN
  static final incCounter = IncrementCounter(counterRepo);
  static final decCounter = DecrementCounter(counterRepo);

  // PRESENTACION
  static CounterBloc buildCounterBloc() {
    return CounterBloc(
      incrementCounter: incCounter,
      decrementCounter: decCounter,
      getCounter: getCounter,
    );
  }
}
