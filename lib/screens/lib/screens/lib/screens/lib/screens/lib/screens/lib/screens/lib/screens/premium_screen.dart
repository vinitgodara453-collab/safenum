import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  static const String launchPrice = '₹39';
  static const String futurePrice = '₹99/month';

  @override
  Widget build(BuildContext context) {
    final features = const [
      (Icons.sim_card_alert_outlined, 'Real-time SIM swap alerts', 'Instant push if your line is reissued'),
      (Icons.shield_moon_outlined, 'Continuous breach monitoring', 'Auto re-checks, not just on demand'),
      (Icons.link_off_rounded, 'Phishing link scanner', 'Scans links in SMS/WhatsApp before you tap'),
      (Icons.apps_outlined, 'Full app permission audit', 'Every sensitive permission on this device'),
      (Icons.visibility_off_outlined, 'Public exposure report', 'Where your number is listed + removal guide'),
      (Icons.support_agent_outlined, 'Priority support', 'Skip the queue when you need help'),
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230,
            pinned: true,
            backgroundColor: AppColors.navy,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.navy, AppColors.navyLight],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 50, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [AppColors.gold, AppColors.goldLight]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('SAFENUM PRO',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.navy)),
                        ),
                        const SizedBox(height: 12),
                        const Text('Complete protection\nfor your number',
                            style: TextStyle(
                                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.2)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: AppColors.gold.withOpacity(0.4), width: 1.5),
                      boxShadow: [
                        BoxShadow(color: AppColors.navy.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 10)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Launch Offer',
                                      style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.navy)),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: AppColors.teal.withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Text('LIMITED',
                                        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.teal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(launchPrice,
                                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: AppColors.navy)),
                                  const Text(' /month', style: TextStyle(color: Colors.black54)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text('Rises gradually to a normal $futurePrice as more features ship — lock in today\'s price now.',
                                  style: TextStyle(fontSize: 11.5, color: Colors.black.withOpacity(0.55), height: 1.3)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text('Everything included', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  const SizedBox(height: 14),
                  ...features.map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                color: AppColors.teal.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Icon(f.$1, size: 18, color: AppColors.teal),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(f.$2, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                                  Text(f.$3, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Hook up to Play Billing / App Store IAP here.
                      },
                      child: Text('Subscribe — $launchPrice/month'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'All premium features still only ever act on your own number and this device — never on anyone else\'s.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.5, color: Colors.black.withOpacity(0.45)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
