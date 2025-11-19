import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'chart_series.dart';
import 'chart_styles.dart';
import 'chart_touch.dart';

class LineChartBuilder {
  static LineChartData buildChart({
    required BuildContext context,
    required List<ChartSeries> series,
  }) {
    return LineChartData(
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 30000,

      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),

      lineTouchData: ChartTouch.touch(context),

      // Build lineBarsData from series list
      lineBarsData: series.map((s) {
        return LineChartBarData(
          spots: s.spots,
          isCurved: true,
          barWidth: s.width,
          color: s.color,
          dashArray: s.dashed ? [6, 6] : null,
          dotData: s.showDots
              ? ChartStyles.dotStyle(s.color)
              : ChartStyles.disabledDots,
          belowBarData: s.showDots
              ? ChartStyles.areaFill(s.color)
              : BarAreaData(show: false),
        );
      }).toList(),
    );
  }
}
