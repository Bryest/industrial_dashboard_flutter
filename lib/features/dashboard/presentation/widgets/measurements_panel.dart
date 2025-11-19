import 'package:flutter/material.dart';

class MeasurementsPanel extends StatelessWidget {
  const MeasurementsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _MeasurementItem(
                label: 'Viscosity',
                value: '1.02 cP',
                color: Color(0xFFFFD5D5),
              ),
              SizedBox(height: 8),
              _MeasurementItem(
                label: 'Temperature',
                value: '25 °C',
                color: Color(0xFFFFF1C2),
              ),
              SizedBox(height: 8),
              _MeasurementItem(
                label: 'Density',
                value: '998 g/cc',
                color: Color(0xFFD5F7D5),
              ),
              SizedBox(height: 8),
              _MeasurementItem(
                label: 'Pressure',
                value: '1.2 bar',
                color: Color(0xFFE2DBFF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MeasurementItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MeasurementItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.black87 : Colors.black87;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: TextStyle(color: textColor)),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
          ),
        ],
      ),
    );
  }
}
