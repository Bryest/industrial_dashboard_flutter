import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dashboard_controller.dart';
import '../../domain/sensor.dart';

class SensorTable extends ConsumerWidget {
  const SensorTable({super.key});

  Color _statusColor(BuildContext ctx, SensorStatus status) {
    switch (status) {
      case SensorStatus.logging:
        return Colors.blue.shade100;
      case SensorStatus.complete:
        return Colors.green.shade100;
      case SensorStatus.pending:
        return Colors.orange.shade100;
    }
  }

  String _statusLabel(SensorStatus status) {
    switch (status) {
      case SensorStatus.logging:
        return 'Logging';
      case SensorStatus.complete:
        return 'Complete';
      case SensorStatus.pending:
        return 'Pending';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sensor overview table',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 32,
                columns: const [
                  DataColumn(label: Text('Sensor')),
                  DataColumn(label: Text('Serial number')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Action')),
                  DataColumn(label: Text('Edit')),
                ],
                rows: [
                  for (var i = 0; i < state.sensors.length; i++)
                    _buildRow(context, ref, state.sensors[i], i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildRow(
    BuildContext context,
    WidgetRef ref,
    Sensor sensor,
    int index,
  ) {
    final controller = ref.read(dashboardControllerProvider.notifier);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.black87 : Colors.black87;
    return DataRow(
      cells: [
        DataCell(Text(sensor.code)),
        DataCell(Text(sensor.serial)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _statusColor(context, sensor.status),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              _statusLabel(sensor.status),
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ),
        ),
        DataCell(
          Switch(
            value: sensor.enabled,
            onChanged: (_) => controller.toggleSensor(index),
          ),
        ),
        const DataCell(Icon(Icons.edit_outlined, size: 18)),
      ],
    );
  }
}
