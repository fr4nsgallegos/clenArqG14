import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int value;
  final bool isLoading;
  final String? error;

  const CounterState({required this.value, this.isLoading = false, this.error});

  CounterState copyWith({int? value, bool? isLoading, String? error}) {
    return CounterState(
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [value, isLoading, error];
}
