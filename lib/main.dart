import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_state.dart';
import 'package:flutter_bloc_paket/cubit_plugin/sayici_cubit.dart';
import 'package:flutter_bloc_paket/theme_cubit.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, tema) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: tema,
          home: MultiBlocProvider(providers: [
            BlocProvider(create: (context) => CounterBloc()),
            BlocProvider(create: (context) => SayiciCubit()),
          ], child: MyHomePage()),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc Paketi"),
      ),
      body: MyCenterWidget(),
      floatingActionButton: MyActions(),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("my center widget build");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) {
            return Text(
              counterState.sayac.toString(),
              style: Theme.of(context).textTheme.headline4,
            );
          }),
          BlocBuilder<SayiciCubit, SayiciState>(
              builder: (context, sayiciState) {
            return Text(
              sayiciState.deger.toString(),
              style: Theme.of(context).textTheme.headline4,
            );
          }),
        ],
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  const MyActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("my actions widget build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.bloc<CounterBloc>().add(CounterArttir());
          },
          tooltip: 'Arttır',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            context.bloc<CounterBloc>().add(CounterAzalt());
          },
          tooltip: 'Azalt',
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            context.bloc<ThemeCubit>().temaDegistir();
          },
          tooltip: 'Tema Değiştir',
          child: Icon(Icons.brightness_6),
        ),
        FloatingActionButton(
          onPressed: () {
            context.bloc<SayiciCubit>().azalt();
          },
          tooltip: 'Tema Değiştir',
          child: Icon(Icons.accessibility),
        ),
      ],
    );
  }
}
