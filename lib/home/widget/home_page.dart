import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stratagem_trainer/home/bloc/game_bloc/game_bloc.dart';
import 'package:stratagem_trainer/home/widget/timer_component.dart';
import 'package:stratagem_trainer/model/action_key.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final _node = FocusNode();

  late final AnimationController _arrowUpController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final AnimationController _arrowDownController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final AnimationController _arrowRightController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final AnimationController _arrowLeftController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final Animation<Color?> animationUp = ColorTween(
    begin: Colors.white,
    end: Colors.yellow,
  ).animate(_arrowUpController);

  late final Animation<Color?> animationDown = ColorTween(
    begin: Colors.white,
    end: Colors.yellow,
  ).animate(_arrowDownController);

  late final Animation<Color?> animationRight = ColorTween(
    begin: Colors.white,
    end: Colors.yellow,
  ).animate(_arrowRightController);

  late final Animation<Color?> animationLeft = ColorTween(
    begin: Colors.white,
    end: Colors.yellow,
  ).animate(_arrowLeftController);

  Future<void> processAnimation(AnimationController controller) async {
    if (controller.isAnimating) {
      controller.reset();
    }
    await controller.forward().whenComplete(() => controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    _node.requestFocus();
    final bloc = context.read<GameBloc>();
    return KeyboardListener(
      focusNode: _node,
      autofocus: true,
      onKeyEvent: (event) async {
        if (event is KeyDownEvent) {
          switch (event.physicalKey) {
            case PhysicalKeyboardKey.arrowUp || PhysicalKeyboardKey.keyW:
              bloc.add(const GameEvent.keyPressed(ActionKey.up));
              await processAnimation(_arrowUpController);
            case PhysicalKeyboardKey.arrowDown || PhysicalKeyboardKey.keyS:
              bloc.add(const GameEvent.keyPressed(ActionKey.down));
              await processAnimation(_arrowDownController);
            case PhysicalKeyboardKey.arrowRight || PhysicalKeyboardKey.keyD:
              bloc.add(const GameEvent.keyPressed(ActionKey.right));
              await processAnimation(_arrowRightController);
            case PhysicalKeyboardKey.arrowLeft || PhysicalKeyboardKey.keyA:
              bloc.add(const GameEvent.keyPressed(ActionKey.left));
              await processAnimation(_arrowLeftController);
          }
        }
      },
      child: BlocListener<GameBloc, GameState>(
        listener: (context, state) async {
          await state.mapOrNull(
            failure: (value) async => showDialog<void>(
              context: context,
              builder: (context) => const Dialog(child: Center(child: Text('LOSE'))),
            ),
            win: (value) async => showDialog<void>(
              context: context,
              builder: (context) => const Dialog(child: Center(child: Text('WIN'))),
            ),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black45,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const Text(
                    'STRATAGEM TRAINER',
                    style: TextStyle(
                        fontFamily: 'Sinclair', fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Row(
                    children: [
                      _MainTab(title: 'Classic', isSelected: false),
                      SizedBox(width: 12),
                      _MainTab(title: 'Daily', isSelected: false),
                      SizedBox(width: 12),
                      _MainTab(title: 'Database', isSelected: false),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<GameBloc, GameState>(
                    builder: (context, state) => Center(child: Text(state.stratagemQueue.firstOrNull?.name ?? '')),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<GameBloc, GameState>(
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.stratagemQueue.isNotEmpty)
                          for (int i = 0; i < state.stratagemQueue.first.code.length; i++)
                            switch (state.stratagemQueue.first.code[i]) {
                              ActionKey.up => Icon(
                                  Icons.arrow_upward,
                                  size: 48,
                                  color: i < state.currentCombo.length ? Colors.yellow : Colors.white,
                                ),
                              ActionKey.down => Icon(
                                  Icons.arrow_downward,
                                  size: 48,
                                  color: i < state.currentCombo.length ? Colors.yellow : Colors.white,
                                ),
                              ActionKey.right => Icon(
                                  Icons.arrow_forward,
                                  size: 48,
                                  color: i < state.currentCombo.length ? Colors.yellow : Colors.white,
                                ),
                              ActionKey.left => Icon(
                                  Icons.arrow_back,
                                  size: 48,
                                  color: i < state.currentCombo.length ? Colors.yellow : Colors.white,
                                ),
                            },
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const TimerComponent(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        builder: (context, child) => Icon(
                          Icons.arrow_back,
                          size: 48,
                          color: animationLeft.value,
                        ),
                        animation: animationLeft,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedBuilder(
                            builder: (context, child) => Icon(
                              Icons.arrow_upward,
                              size: 48,
                              color: animationUp.value,
                            ),
                            animation: animationUp,
                          ),
                          const SizedBox(height: 48),
                          AnimatedBuilder(
                            builder: (context, child) => Icon(
                              Icons.arrow_downward,
                              size: 48,
                              color: animationDown.value,
                            ),
                            animation: animationDown,
                          ),
                        ],
                      ),
                      AnimatedBuilder(
                        builder: (context, child) => Icon(
                          Icons.arrow_forward,
                          size: 48,
                          color: animationRight.value,
                        ),
                        animation: animationRight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class _MainTab extends StatelessWidget {
  const _MainTab({required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white70,
          ),
          left: BorderSide(
            color: Colors.white70,
          ),
          right: BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 32, 8),
        child: Text(
          title,
          style: const TextStyle(fontFamily: 'Sinclair', fontSize: 20, color: Colors.white70),
        ),
      ),
    );
  }
}
