import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 240,
      color: isDark ? const Color(0xFF111317) : const Color(0xFF171A1F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Industrial Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _sectionItem(Icons.dashboard, 'Dashboard', selected: true),
          _sectionItem(Icons.sensors, 'Sensors'),
          const Spacer(),
          _sectionItem(Icons.help_outline, 'Help'),
          _sectionItem(Icons.person_outline, 'Account'),
          _sectionItem(Icons.language, 'Language'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _sectionItem(IconData icon, String label, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8, right: 12),
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(label, style: const TextStyle(color: Colors.white)),
          horizontalTitleGap: 0,
          dense: true,
        ),
      ),
    );
  }
}
