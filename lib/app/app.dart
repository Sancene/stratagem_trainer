import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stratagem_trainer/common/resources/theme.dart';
import 'package:stratagem_trainer/home/bloc/game_bloc/game_bloc.dart';
import 'package:stratagem_trainer/home/widget/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc()..add(const GameEvent.setupNewQueue()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
