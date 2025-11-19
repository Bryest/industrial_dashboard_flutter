import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartStyles {
  static BarAreaData areaFill(Color color) => BarAreaData(
    show: true,
    gradient: LinearGradient(
      colors: [color.withValues(alpha: 0.18), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  static FlDotData dotStyle(Color color) => FlDotData(
    show: true,
    getDotPainter: (_, __, ___, ____) {
      return FlDotCirclePainter(
        radius: 4,
        color: Colors.white,
        strokeWidth: 3,
        strokeColor: color,
      );
    },
  );

  static FlLine crosshairLine = FlLine(color: Colors.black, strokeWidth: 1);

  static final FlDotData disabledDots = const FlDotData(show: false);
}
