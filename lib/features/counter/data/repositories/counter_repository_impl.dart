// Implementa el contrato
// El domain lleana el repository, y data resuelve cómo
import 'package:cleanaerqg14/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:cleanaerqg14/features/counter/data/models/counter_model.dart';
import 'package:cleanaerqg14/features/counter/domain/entities/counter.dart';
import 'package:cleanaerqg14/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDatasource local;
  CounterRepositoryImpl(this.local);

  @override
  Future<Counter> getCounter() async {
    final v = await local.getValue();
    return CounterModel(value: v).toEntity();
  }

  @override
  Future<Counter> increment() async {
    final v = await local.increment();
    return CounterModel(value: v).toEntity();
  }

  @override
  Future<Counter> decrement() async {
    final v = await local.decrement();
    return CounterModel(value: v).toEntity();
  }
}
