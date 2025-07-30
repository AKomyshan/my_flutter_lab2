import 'package:flutter/material.dart';

class SliverStackView extends StatefulWidget {
  const SliverStackView({
    required this.children,
    required this.remaining,
    this.spacing = 0,
    super.key,
  });

  final List<Widget> children;
  final Widget remaining;
  final double spacing;

  @override
  State<SliverStackView> createState() => _SliverStackViewState();
}

class _SliverStackViewState extends State<SliverStackView> {
  final GlobalKey _remainingWidgetKey = GlobalKey();
  double _remainingWidgetHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getRemainingWidgetHeight();
    });
  }

  void _getRemainingWidgetHeight() {
    final renderBox =
        _remainingWidgetKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null && renderBox.size.height != _remainingWidgetHeight) {
      setState(() {
        _remainingWidgetHeight = renderBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                      // to be sure that 'pull to refresh' case won't break
                      // the app bar and the first widget
                      top: MediaQuery.of(context).padding.top - 10,
                      bottom: _remainingWidgetHeight,
                    ),
                    child: Column(
                      spacing: widget.spacing,
                      children: widget.children,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            key: _remainingWidgetKey,
            child: widget.remaining,
          ),
        ),
      ],
    );
  }
}
