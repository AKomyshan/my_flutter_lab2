import 'dart:math';

import 'package:flutter/material.dart';

class Homework22Screen extends StatefulWidget {
  const Homework22Screen({super.key});

  @override
  State<Homework22Screen> createState() => _Homework22ScreenState();
}

class _Homework22ScreenState extends State<Homework22Screen>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _xTranslateController;

  late final Animation<double> _rotationAnimation;
  late final Animation<double> _xTranslateAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
    );
    _xTranslateController = AnimationController(vsync: this);

    _rotationAnimation = Tween<double>(
      begin: _rotationController.value,
      end: _rotationController.value + (Random().nextBool() ? 1.0 : -1.0),
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.easeOutCubic,
      ),
    );
    _xTranslateAnimation = Tween<double>(begin: 0.0, end: -200.0).animate(
      CurvedAnimation(
        parent: _xTranslateController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
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
            child: GestureDetector(
              onTap: _handleBallTap,
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (_, child) {
                  return Transform.translate(
                    offset: Offset(0, _xTranslateAnimation.value),
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: child,
                    ),
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
    if (_rotationController.isAnimating) return;

    const minDuration = 200;
    const maxDuration = 1500;
    final duration =
        minDuration + Random().nextInt(maxDuration - minDuration + 1);

    _rotationController
      ..reset()
      ..duration = Duration(milliseconds: duration)
      ..forward();

    _xTranslateController
      ..reset()
      ..duration = Duration(milliseconds: duration)
      ..forward().then((_) => _rotationController.reverse());
  }
}
