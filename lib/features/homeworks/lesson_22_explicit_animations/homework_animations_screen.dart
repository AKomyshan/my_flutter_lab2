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

  late Animation<double> _yTranslateAnimation;

  late final double screenHeight;

  @override
  void initState() {
    super.initState();

    final currentView = PlatformDispatcher.instance.views.first;
    final screenPixelRatio = currentView.devicePixelRatio;
    final screenHeightPixels = currentView.physicalSize.longestSide;
    screenHeight = screenHeightPixels / screenPixelRatio;

    _yTranslateController = AnimationController(vsync: this);

    _yTranslateAnimation = Tween<double>(
      begin: 0.0,
      end: -(screenHeight - 300),
    ).animate(
      CurvedAnimation(
        parent: _yTranslateController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _yTranslateController.dispose();
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
                  child: child,
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

    const min = 300;
    const max = 700;
    final randomMilliseconds = min + Random().nextInt(max - min + 1);

    _startBounce(
      power: 1.0,
      duration: Duration(milliseconds: randomMilliseconds),
    );
  }

  void _startBounce({required double power, required Duration duration}) {
    if (power < 0.1) {
      _yTranslateController.reset();
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

    _yTranslateController
      ..reset()
      ..duration =
          Duration(milliseconds: (duration.inMilliseconds * power).round())
      ..forward().then(
        (_) {
          _yTranslateAnimation = Tween<double>(
            begin: _yTranslateAnimation.value,
            end: 0.0,
          ).animate(
            CurvedAnimation(
              parent: _yTranslateController,
              curve: Curves.easeIn,
            ),
          );
          _yTranslateController
            ..reset()
            ..duration = Duration(
                milliseconds: (duration.inMilliseconds * power).round())
            // Reduce the bounce power for the next cycle
            ..forward().then(
              (_) => _startBounce(power: power * 0.8, duration: duration),
            );
        },
      );
  }
}
