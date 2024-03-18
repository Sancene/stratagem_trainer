import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stratagem_trainer/home/bloc/game_bloc/game_bloc.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({super.key});

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  int _timeRemaining = 5;

  late final Timer _gameTimer;

  @override
  void initState() {
    super.initState();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        context.read<GameBloc>().add(const GameEvent.timerExpired());
        return;
      }
      _getTime();
    });
  }

  void _getTime() {
    setState(() {
      _timeRemaining == 0 ? _timeRemaining = 0 : _timeRemaining--;
    });
  }

  @override
  void dispose() {
    _gameTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) => state.mapOrNull(
        completedStratagem: (value) => _timeRemaining += 2,
      ),
      child: Text(_timeRemaining.toString()),
    );
  }
}
