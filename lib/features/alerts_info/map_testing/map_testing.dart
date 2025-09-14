import 'package:flutter/material.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({super.key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class _MapTestingState extends State<MapTesting> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
