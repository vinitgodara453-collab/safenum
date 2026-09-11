import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class _Event {
  final IconData icon;
  final String title;
  final String time;
  final Color color;
  const _Event(this.icon, this.title, this.time, this.color);
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const events = [
      _Event(Icons.check_circle_outline, 'Breach check completed — no leaks found', '2h ago', AppColors.teal),
      _Event(Icons.phone_disabled_outlined, 'Blocked a reported spam caller', '5h ago', Color(0xFFB98900)),
      _Event(Icons.shield_outlined, 'Security score updated to 78', '1d ago', AppColors.navy),
      _Event(Icons.apps_outlined, 'Permission audit run on this device', '2d ago', AppColors.teal),
      _Event(Icons.sim_card_alert_outlined, 'SIM status verified — no changes', '3d ago', AppColors.navy),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Activity')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final e = events[i];
          return Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: AppColors.navy.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 6))],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(color: e.color.withOpacity(0.1), borderRadius: BorderRadius.circular(11)),
                  child: Icon(e.icon, color: e.color, size: 18),
                ),
                const SizedBox(width: 14),
                Expanded(child: Text(e.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
                Text(e.time, style: const TextStyle(fontSize: 11, color: Colors.black38)),
              ],
            ),
          );
        },
      ),
    );
  }
}
