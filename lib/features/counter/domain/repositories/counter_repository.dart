import 'package:cleanaerqg14/features/counter/domain/entities/counter.dart';

// Esto es un "contrato" Domain dice qué necesita, no cómo
abstract class CounterRepository {
  Future<Counter> getCounter();
  Future<Counter> increment();
  Future<Counter> decrement();
}
