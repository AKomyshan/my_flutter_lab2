import 'dart:ui';

import 'package:flutter_lab/features/alerts_info/geo_tools/map_transform.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/polygon.dart';

class GeoFeature {
  GeoFeature({
    required this.id,
    required this.displayName,
    required this.polygons,
  });

  final String id;
  final String? displayName;
  final List<Polygon> polygons;

  Path buildPath(MapTransform t) {
    final p = Path()..fillType = PathFillType.evenOdd;

    for (final poly in polygons) {
      for (var r = 0; r < poly.rings.length; r++) {
        final ring = poly.rings[r];
        if (ring.isEmpty) continue;

        final first = t.toCanvas(ring.first);
        p.moveTo(first.dx, first.dy);
        for (var i = 1; i < ring.length; i++) {
          final pt = t.toCanvas(ring[i]);
          p.lineTo(pt.dx, pt.dy);
        }
        p.close();
      }
    }
    return p;
  }
}