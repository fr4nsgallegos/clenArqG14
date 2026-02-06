import 'package:cleanaerqg14/features/counter/domain/entities/counter.dart';
import 'package:cleanaerqg14/features/counter/domain/repositories/counter_repository.dart';

// USECASE es una acción del sistema - igual que en app reales como login user, GETPROGFILE SEND MESSAGE
class DecrementCounter {
  final CounterRepository repository;
  DecrementCounter(this.repository);

  Future<Counter> call() => repository.decrement();
}
