import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:cleanaerqg14/features/counter/presentation/bloc/counter_event.dart';
import 'package:cleanaerqg14/features/counter/presentation/pages/counter_page.dart';
import 'package:cleanaerqg14/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (_) => Injection.buildCounterBloc()..add(CounterStarted()),
        ),
        // AQUI PUEDOI IR AGREGANDO MAS BLOCS
      ],
      child: MaterialApp(
        home: CounterPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
