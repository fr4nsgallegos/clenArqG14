import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_event.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Clean + Bloc")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return CircularProgressIndicator();
            }
            return Text(
              "Valor: ${state.value}",
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
    );
  }
}
