import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Homework22Screen extends StatefulWidget {
  const Homework22Screen({super.key});

  @override
  State<Homework22Screen> createState() => _Homework22ScreenState();
}

class _Homework22ScreenState extends State<Homework22Screen>
    with TickerProviderStateMixin {
  late final AnimationController _yTranslateController;
  late final AnimationController _rotationController;

  late Animation<double> _yTranslateAnimation;
  late Animation<double> _rotationAnimation;

  late final double screenHeight;

  @override
  void initState() {
    super.initState();

    final currentView = PlatformDispatcher.instance.views.first;
    final screenPixelRatio = currentView.devicePixelRatio;
    final screenHeightPixels = currentView.physicalSize.longestSide;
    screenHeight = screenHeightPixels / screenPixelRatio;

    _yTranslateController = AnimationController(vsync: this);
    _rotationController = AnimationController(vsync: this);

    _yTranslateAnimation = Tween<double>(
      begin: 0.0,
      end: -(screenHeight - 300),
    ).animate(
      CurvedAnimation(
        parent: _yTranslateController,
        curve: Curves.easeOut,
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(_rotationController);
  }

  @override
  void dispose() {
    _yTranslateController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Ball'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green.shade50,
                    Colors.green.shade800,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: AnimatedBuilder(
              animation: _yTranslateController,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, _yTranslateAnimation.value),
                  child: RotationTransition(
                    turns: _rotationAnimation,
                    child: child,
                  ),
                );
              },
              child: GestureDetector(
                onTap: _handleBallTap,
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: Image.asset('assets/images/ball.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleBallTap() {
    if (_yTranslateController.isAnimating) return;

    const minMilliseconds = 300;
    const maxMilliseconds = 700;

    const minPowerReducer = 0.4;
    const maxPowerReducer = 0.8;

    final random = Random();

    final randomMilliseconds =
        minMilliseconds + random.nextInt(maxMilliseconds - minMilliseconds + 1);

    final randomPowerReducer = minPowerReducer +
        random.nextDouble() * (maxPowerReducer - minPowerReducer);

    _startBounce(
      power: 1.0,
      powerReducer: randomPowerReducer,
      duration: Duration(milliseconds: randomMilliseconds),
    );
  }

  void _startBounce({
    required double power,
    required double powerReducer,
    required Duration duration,
  }) {
    if (power < 0.1) {
      _yTranslateController.reset();
      _rotationController.stop();
      return;
    }

    _yTranslateAnimation = Tween<double>(
      begin: 0.0,
      end: -(screenHeight - 300) * power,
    ).animate(
      CurvedAnimation(
        parent: _yTranslateController,
        curve: Curves.easeOut,
      ),
    );

    final angularVelocityDuration = Duration(
      milliseconds: max(200, 1500 ~/ power),
    );

    _rotationController
      ..duration = angularVelocityDuration
      ..repeat();

    _yTranslateController
      ..duration =
          Duration(milliseconds: (duration.inMilliseconds * power).round())
      ..forward().then(
        (_) => _yTranslateController.reverse().then(
              (_) => _startBounce(
                power: power * powerReducer,
                powerReducer: power,
                duration: duration,
              ),
            ),
      );
  }
}
