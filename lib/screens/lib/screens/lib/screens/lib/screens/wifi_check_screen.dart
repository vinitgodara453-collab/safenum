import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class WifiCheckScreen extends StatelessWidget {
  const WifiCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checks = const [
      ('Encryption', 'WPA2/WPA3 detected', true),
      ('Open network', 'Not an open/public hotspot', true),
      ('Known network', 'Previously connected safely', true),
      ('VPN active', 'No VPN detected on this connection', false),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Wi-Fi Security')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.navy, AppColors.navyLight]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.wifi_rounded, color: Colors.white, size: 28),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Network', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Text('Mostly Safe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ...checks.map((c) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: AppColors.navy.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 5))],
                ),
                child: Row(
                  children: [
                    Icon(c.$3 ? Icons.check_circle : Icons.warning_amber_rounded,
                        color: c.$3 ? AppColors.teal : Colors.orange, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.$1, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                          Text(c.$2, style: const TextStyle(fontSize: 11.5, color: Colors.black45)),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
