import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartTouch {
  static LineTouchData touch(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final indicatorColor = isDark
        ? const Color.fromARGB(255, 207, 196, 196)
        : Colors.black;

    final dotBorderColor = isDark
        ? const Color.fromARGB(255, 207, 196, 196)
        : Colors.black;

    return LineTouchData(
      enabled: true,
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipRoundedRadius: 14,
        tooltipPadding: const EdgeInsets.all(12),
        fitInsideHorizontally: false,
        fitInsideVertically: false,
        showOnTopOfTheChartBoxArea: false,
        getTooltipItems: (spots) {
          final spot = spots.first;
          return [
            LineTooltipItem(
              spot.y.toInt().toString(),
              TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ];
        },
      ),

      // Vertical line + dot painter
      getTouchedSpotIndicator: (LineChartBarData bar, List<int> indexes) {
        return indexes.map((i) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: indicatorColor, // ← aquí el color dinámico
              strokeWidth: 1,
            ),
            FlDotData(
              show: true,
              getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                radius: 5,
                color: isDark ? Colors.white : Colors.black,
                strokeWidth: 3,
                strokeColor: dotBorderColor, // ← borde dinámico
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
