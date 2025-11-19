import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSeries {
  final List<FlSpot> spots;
  final Color color;
  final double width;
  final bool dashed;
  final bool showDots;

  const ChartSeries({
    required this.spots,
    required this.color,
    required this.width,
    this.dashed = false,
    this.showDots = false,
  });

  static List<ChartSeries> resolveSeries(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      ChartSeries(
        spots: const [
          FlSpot(0, 9000),
          FlSpot(1, 11000),
          FlSpot(2, 8000),
          FlSpot(3, 16000),
          FlSpot(4, 23000),
          FlSpot(5, 21000),
          FlSpot(6, 25000),
        ],
        color: isDark ? const Color.fromARGB(255, 207, 196, 196) : Colors.black,
        width: 3,
        showDots: true,
      ),

      ChartSeries(
        spots: const [
          FlSpot(0, 10000),
          FlSpot(1, 17000),
          FlSpot(2, 13000),
          FlSpot(3, 19000),
          FlSpot(4, 14000),
          FlSpot(5, 21000),
          FlSpot(6, 28000),
        ],
        color: Color(0xFF9BB6FF),
        width: 2,
        dashed: true,
        showDots: false,
      ),
    ];
  }
}
