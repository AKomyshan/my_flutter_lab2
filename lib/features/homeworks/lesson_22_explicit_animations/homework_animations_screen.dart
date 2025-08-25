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

  late final Animation<double> _yTranslateAnimation;

  @override
  void initState() {
    super.initState();

    final currentView = PlatformDispatcher.instance.views.first;
    final screenPixelRatio = currentView.devicePixelRatio;
    final screenHeightPixels = currentView.physicalSize.longestSide;

    _yTranslateController = AnimationController(vsync: this);

    _yTranslateAnimation = Tween<double>(
      begin: 0.0,
      end: -((screenHeightPixels / screenPixelRatio) - 350),
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
            child: GestureDetector(
              onTap: _handleBallTap,
              child: AnimatedBuilder(
                animation: _yTranslateController,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, _yTranslateAnimation.value),
                    child: child,
                  );
                },
                child: SizedBox(
                  height: 150,
                  width: 150,
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

    const minDuration = 200;
    const maxDuration = 500;
    final duration =
        minDuration + Random().nextInt(maxDuration - minDuration + 1);

    _yTranslateController
      ..reset()
      ..duration = Duration(milliseconds: duration)
      ..forward().then((_) => _yTranslateController.reverse());
  }
}
