import 'package:flutter/material.dart';
import '../main.dart' show AppColors;
import '../widgets/security_score_card.dart';
import '../widgets/feature_tile.dart';
import 'breach_check_screen.dart';
import 'spam_check_screen.dart';
import 'permission_audit_screen.dart';
import 'sim_swap_screen.dart';
import 'password_check_screen.dart';
import 'wifi_check_screen.dart';
import 'premium_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('SafeNum', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: AppColors.navy)),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.gold, AppColors.goldLight]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PremiumScreen()),
                    ),
                    icon: const Icon(Icons.workspace_premium_rounded, size: 17, color: AppColors.navy),
                    label: const Text('PRO',
                        style: TextStyle(color: AppColors.navy, fontWeight: FontWeight.w800, fontSize: 12)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          const SecurityScoreCard(score: 78),
          const SizedBox(height: 16),
          const Text('Protect your number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.95,
            children: [
              FeatureTile(
                icon: Icons.shield_outlined,
                title: 'Breach Check',
                subtitle: 'See if your own number/email was leaked',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const BreachCheckScreen())),
              ),
              FeatureTile(
                icon: Icons.phone_disabled_outlined,
                title: 'Spam Call Check',
                subtitle: 'Identify unknown incoming callers',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SpamCheckScreen())),
              ),
              FeatureTile(
                icon: Icons.sim_card_alert_outlined,
                title: 'SIM Swap Alert',
                subtitle: 'Get notified if your SIM is reissued',
                locked: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SimSwapScreen())),
              ),
              FeatureTile(
                icon: Icons.apps_outlined,
                title: 'App Permission Audit',
                subtitle: 'See which apps on THIS phone can see too much',
                locked: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PermissionAuditScreen())),
              ),
              FeatureTile(
                icon: Icons.password_rounded,
                title: 'Password Strength',
                subtitle: 'Checked on-device only, never sent anywhere',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PasswordCheckScreen())),
              ),
              FeatureTile(
                icon: Icons.wifi_rounded,
                title: 'Wi-Fi Security',
                subtitle: 'Check the network this device is on',
                locked: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WifiCheckScreen())),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.teal.withOpacity(0.07),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.teal.withOpacity(0.18)),
            ),
            child: Row(
              children: [
                const Icon(Icons.verified_user_outlined, color: AppColors.teal),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'SafeNum never looks up anyone else\'s number. Every check here only ever uses your own, verified number.',
                    style: TextStyle(fontSize: 12.5, color: Colors.black.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}
