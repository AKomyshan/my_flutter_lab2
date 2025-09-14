import 'dart:ui';

import 'package:flutter_lab/features/alerts_info/geo_tools/geo_feature.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/polygon.dart';

class GeoData {
  final List<GeoFeature> features;
  final Rect worldBounds;

  GeoData({required this.features, required this.worldBounds});

  factory GeoData.fromGeoJson(Map<String, dynamic> fc) {
    if (fc['type'] != 'FeatureCollection') {
      throw ArgumentError('Ожидался FeatureCollection');
    }
    final feats = <GeoFeature>[];
    double? minX, maxX, minY, maxY;

    int autoId = 0;
    for (final f in (fc['features'] as List)) {
      final m = f as Map<String, dynamic>;
      final props = (m['properties'] as Map?)?.cast<String, dynamic>() ?? {};

      final id = (m['id']?.toString()) ??
          props['id']?.toString() ??
          (++autoId).toString();

      final name = (props['name'] ??
          props['NAME_1'] ??
          props['NAME'] ??
          props['oblast'] ??
          props['admin1Name'])
          ?.toString();

      final geom = m['geometry'] as Map<String, dynamic>;
      final type = geom['type'] as String;
      final rawCoords = geom['coordinates'];

      final polygons = <Polygon>[];

      void addPolygonRings(List rings) {
        // rings: [ [ [lon,lat], ... ] , [hole], ... ]
        final ringList = <List<Offset>>[];
        for (final ring in rings) {
          final pts = <Offset>[];
          for (final pair in (ring as List)) {
            final lon = (pair[0] as num).toDouble();
            final lat = (pair[1] as num).toDouble();
            // Переводим в "мир": x=lon, y=-lat (чтобы север был вверх)
            final x = lon;
            final y = -lat;

            if (minX == null || x < minX!) minX = x;
            if (maxX == null || x > maxX!) maxX = x;
            if (minY == null || y < minY!) minY = y;
            if (maxY == null || y > maxY!) maxY = y;

            pts.add(Offset(x, y));
          }
          ringList.add(pts);
        }
        polygons.add(Polygon(rings: ringList));
      }

      if (type == 'Polygon') {
        addPolygonRings(rawCoords as List);
      } else if (type == 'MultiPolygon') {
        for (final poly in (rawCoords as List)) {
          addPolygonRings(poly as List);
        }
      } else {
        // Пропускаем прочие типы (LineString/Point)
        continue;
      }

      feats.add(GeoFeature(id: id, displayName: name, polygons: polygons));
    }

    if (minX == null) {
      throw StateError('В GeoJSON нет полигонов');
    }

    final bounds = Rect.fromLTRB(minX!, minY!, maxX!, maxY!);

    return GeoData(features: feats, worldBounds: bounds);
  }
}
