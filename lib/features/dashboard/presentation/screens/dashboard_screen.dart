import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme_notifier.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_filters.dart';
import '../widgets/metric_card.dart';
import '../widgets/chart/chart_series.dart';
import '../widgets/chart/line_chart_builder.dart';
import '../widgets/measurements_panel.dart';
import '../widgets/sensor_table.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                // ─────────────────────── TOP BAR
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            tooltip: 'Toggle light/dark theme',
                            icon: const Icon(Icons.brightness_6),
                            onPressed: () =>
                                ref.read(themeModeProvider.notifier).toggle(),
                          ),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(167, 200, 200, 255),
                            child: const Text('R'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ─────────────────────── BODY
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopFiltersRow(),
                          const SizedBox(height: 24),

                          // ─────────────────────── METRIC CARDS
                          Row(
                            children: [
                              const Expanded(
                                child: MetricCard(
                                  title: 'Data',
                                  value: '7,265',
                                  subtitle: '+11.01%',
                                  showTrendIcon: true,
                                ),
                              ),
                              const SizedBox(width: 16),

                              const Expanded(
                                child: MetricCard(
                                  title: 'Sensors connected',
                                  value: '3',
                                ),
                              ),
                              const SizedBox(width: 16),

                              const Expanded(
                                child: MetricCard(
                                  title: 'Events created',
                                  value: '156',
                                  subtitle: '+15.03%',
                                  showTrendIcon: true,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // ─────────────────────── CHART + MEASUREMENTS
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.hardEdge, // IMPORTANTEEE
                                  child: Padding(
                                    padding: const EdgeInsets.all(22),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Title + legend
                                        Row(
                                          children: [
                                            const Text(
                                              'Total Data from sensors',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                            const Spacer(),
                                            _dot(Colors.black),
                                            const SizedBox(width: 6),
                                            const Text("This year"),
                                            const SizedBox(width: 18),
                                            _dot(Color(0xFF9BB6FF)),
                                            const SizedBox(width: 6),
                                            const Text("Last year"),
                                          ],
                                        ),

                                        const SizedBox(height: 14),

                                        // THE CHART
                                        SizedBox(
                                          height: 250,
                                          child: ClipRect(
                                            child: RepaintBoundary(
                                              child: LayoutBuilder(
                                                builder: (context, constraints) {
                                                  return LineChart(
                                                    LineChartBuilder.buildChart(
                                                      context: context,
                                                      series: ChartSeries.resolveSeries(context),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 24),

                              const MeasurementsPanel(),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // ─────────────────────── SENSOR TABLE
                          SensorTable(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
