import 'dart:math' as math;
import 'dart:ui';

class MapTransform {
  final double scale;
  final double tx;
  final double ty;

  MapTransform({required this.scale, required this.tx, required this.ty});

  factory MapTransform.fromBounds({
    required Rect world,
    required Size canvasSize,
    double padding = 0,
  }) {
    final innerW = math.max(1.0, canvasSize.width - 2 * padding);
    final innerH = math.max(1.0, canvasSize.height - 2 * padding);

    final sx = innerW / world.width;
    final sy = innerH / world.height;
    final s = math.min(sx, sy);

    final drawW = world.width * s;
    final drawH = world.height * s;

    // Центрируем в доступной области
    final left = padding + (innerW - drawW) / 2 - world.left * s;
    final top = padding + (innerH - drawH) / 2 - world.top * s;

    return MapTransform(scale: s, tx: left, ty: top);
  }

  Offset toCanvas(Offset worldPt) => Offset(
    worldPt.dx * scale + tx,
    worldPt.dy * scale + ty,
  );
}