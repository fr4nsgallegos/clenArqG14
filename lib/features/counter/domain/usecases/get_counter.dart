import 'package:cleanaerqg14/features/counter/domain/entities/counter.dart';
import 'package:cleanaerqg14/features/counter/domain/repositories/counter_repository.dart';

class GetCounter {
  final CounterRepository repository;
  GetCounter(this.repository);

  Future<Counter> call() => repository.getCounter();
}
