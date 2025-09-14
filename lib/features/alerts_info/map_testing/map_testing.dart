import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_lab/features/alerts_info/geo_tools/geo_data.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/map_painter.dart';
import 'package:flutter_lab/features/alerts_info/geo_tools/map_transform.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({super.key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class _MapTestingState extends State<MapTesting> {
  bool _loading = true;
  String? _error;
  late final GeoData _geo;
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _loadGeo();
  }

  // !!!CAUTION!!! Not a big optimized - in avg this approach need 40 MB RAM.
  // Raw geoJSON just grabbed from the first google source - https://simplemaps.com/gis/country/ua#admin1
  // Real word app should use `mapshaper`ed map or use real 'libre' map
  // or use predefined memory efficient SVG with defined regions by SVG path+id
  Future<void> _loadGeo() async {
    try {
      final raw = await rootBundle.loadString('assets/geo/ua.json');
      final decoded = json.decode(raw) as Map<String, dynamic>;
      _geo = GeoData.fromGeoJson(decoded);
      setState(() => _loading = false);
    } catch (e) {
      setState(() {
        _error = 'Unable to load GeoJSON: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = _loading
        ? const Center(child: CircularProgressIndicator())
        : _error != null
            ? Center(child: Text(_error!))
            : LayoutBuilder(
                builder: (context, constraints) {
                  final size =
                      Size(constraints.maxWidth, constraints.maxHeight);
                  final tx = MapTransform.fromBounds(
                    world: _geo.worldBounds,
                    canvasSize: size,
                    padding: 16,
                  );

                  return GestureDetector(
                    onTapUp: (details) {
                      final tap = details.localPosition;
                      // Проверим попадание в полигоны (с конца — чтобы "верхние" выигрывали)
                      String? hitId;
                      for (final f in _geo.features.reversed) {
                        final path = f.buildPath(tx);
                        if (path.contains(tap)) {
                          hitId = f.id;
                          break;
                        }
                      }
                      if (hitId != _selectedId) {
                        setState(() => _selectedId = hitId);
                      }
                    },
                    child: CustomPaint(
                      painter: MapPainter(
                        geo: _geo,
                        transform: tx,
                        selectedId: _selectedId,
                      ),
                      // Для корректного получения размеров GestureDetector
                      size: Size.infinite,
                    ),
                  );
                },
              );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Playground'),
        actions: [
          if (_selectedId != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Center(
                child: Text(
                  _geo.features
                          .firstWhere((f) => f.id == _selectedId)
                          .displayName ??
                      _selectedId!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
      body: body,
    );
  }
}
