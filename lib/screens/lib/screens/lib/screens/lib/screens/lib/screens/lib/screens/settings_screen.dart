import 'package:flutter/material.dart';
import '../main.dart' show AppColors;
import 'premium_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
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
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.gold.withOpacity(0.2),
                  child: const Icon(Icons.person_rounded, color: AppColors.goldLight, size: 26),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      Text('Verified number • Free plan', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _sectionLabel('Protection'),
          _tile(context, Icons.workspace_premium_rounded, 'Go Premium', 'Unlock all monitoring features',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen()))),
          _tile(context, Icons.notifications_active_outlined, 'Alert preferences', 'Choose what notifies you'),
          _tile(context, Icons.history_rounded, 'Data & activity log', 'See what SafeNum has checked'),
          const SizedBox(height: 16),
          _sectionLabel('Privacy'),
          _tile(context, Icons.policy_outlined, 'Privacy policy', 'What SafeNum does and never does'),
          _tile(context, Icons.delete_outline_rounded, 'Delete my data', 'Remove your account & local vault'),
          const SizedBox(height: 16),
          _sectionLabel('Support'),
          _tile(context, Icons.help_outline_rounded, 'Help center', 'FAQs & troubleshooting'),
          _tile(context, Icons.mail_outline_rounded, 'Contact us', 'support@safenum.app'),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 4),
        child: Text(text.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black38, letterSpacing: 0.6)),
      );

  Widget _tile(BuildContext context, IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.navy.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 5))],
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(color: AppColors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(11)),
          child: Icon(icon, color: AppColors.teal, size: 19),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 11.5, color: Colors.black45)),
        trailing: const Icon(Icons.chevron_right_rounded, color: Colors.black26),
      ),
    );
  }
}
