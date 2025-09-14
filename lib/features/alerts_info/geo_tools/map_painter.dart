import 'package:flutter/material.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/geo_data.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/map_transform.dart';

class MapPainter extends CustomPainter {
  final GeoData geo;
  final MapTransform transform;
  final String? selectedId;

  MapPainter({
    required this.geo,
    required this.transform,
    required this.selectedId,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..style = PaintingStyle.fill;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = Colors.black.withOpacity(0.6)
      ..isAntiAlias = true;

    for (final f in geo.features) {
      final path = f.buildPath(transform);

      final isSelected = f.id == selectedId;
      fill.color = isSelected
          ? Colors.orange.withOpacity(0.85)
          : Colors.blueGrey.withOpacity(0.55);

      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.geo != geo ||
        oldDelegate.selectedId != selectedId ||
        oldDelegate.transform.scale != transform.scale ||
        oldDelegate.transform.tx != transform.tx ||
        oldDelegate.transform.ty != transform.ty;
  }
}

