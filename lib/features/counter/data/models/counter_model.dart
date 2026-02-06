// Convierte a entity
// El modelo (json, db etc) se convierte en entity
import 'package:cleanaerqg14/features/counter/domain/entities/counter.dart';

class CounterModel {
  final int value;
  const CounterModel({required this.value});

  Counter toEntity() => Counter(value);
}
