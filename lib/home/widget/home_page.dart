import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return KeyboardListener(
      focusNode: _node,
      autofocus: true,
      onKeyEvent: (event) async {
        if (event is KeyDownEvent) {
          switch (event.physicalKey) {
            case PhysicalKeyboardKey.arrowUp || PhysicalKeyboardKey.keyW:
              await processAnimation(_arrowUpController);
            case PhysicalKeyboardKey.arrowDown || PhysicalKeyboardKey.keyS:
              await processAnimation(_arrowDownController);
            case PhysicalKeyboardKey.arrowRight || PhysicalKeyboardKey.keyD:
              await processAnimation(_arrowRightController);
            case PhysicalKeyboardKey.arrowLeft || PhysicalKeyboardKey.keyA:
              await processAnimation(_arrowLeftController);
          }
        }
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
                  style:
                      TextStyle(fontFamily: 'Sinclair', fontSize: 36, fontWeight: FontWeight.w700, color: Colors.white),
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
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
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
