import 'package:flutter/material.dart';

class TopFiltersRow extends StatelessWidget {
  const TopFiltersRow({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(14);

    InputDecoration _dec(String label, String hint) {
      return InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: borderRadius),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(decoration: _dec('Search sensor', 'Search...')),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: _dec('Connection Type', 'Select'),
              items: const [
                DropdownMenuItem(value: 'Ethernet', child: Text('Ethernet')),
                DropdownMenuItem(value: 'WiFi', child: Text('WiFi')),
              ],
              onChanged: (_) {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: _dec('Sensor Type', 'Select'),
              items: const [
                DropdownMenuItem(value: 'SRD', child: Text('SRD')),
                DropdownMenuItem(value: 'SRV', child: Text('SRV')),
              ],
              onChanged: (_) {},
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Sensor'),
            ),
          ),
        ],
      ),
    );
  }
}
