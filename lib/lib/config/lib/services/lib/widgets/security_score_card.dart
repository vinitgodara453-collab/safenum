import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class SecurityScoreCard extends StatelessWidget {
  final int score;
  const SecurityScoreCard({super.key, required this.score});

  String _label() {
    if (score >= 80) return 'Well protected';
    if (score >= 50) return 'Needs attention';
    return 'At risk';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.navy, AppColors.navyLight],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withOpacity(0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 76,
            height: 76,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.12),
                  valueColor: const AlwaysStoppedAnimation(AppColors.gold),
                ),
                Text('$score',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Security Score',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.5, color: Colors.white)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.gold.withOpacity(0.5)),
                      ),
                      child: const Text('PRO',
                          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.goldLight)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(_label(),
                    style: const TextStyle(color: AppColors.goldLight, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(
                  'Based only on your own number & this device.',
                  style: TextStyle(fontSize: 11.5, color: Colors.white.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
