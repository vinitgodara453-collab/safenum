import 'package:flutter/material.dart';
import '../main.dart' show AppColors;
import 'home_screen.dart';
import 'vault_screen.dart';
import 'activity_screen.dart';
import 'settings_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    VaultScreen(),
    ActivityScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColors.navy.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -4)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, Icons.shield_outlined, Icons.shield_rounded, 'Home'),
                _navItem(1, Icons.lock_outline_rounded, Icons.lock_rounded, 'Vault'),
                _navItem(2, Icons.notifications_outlined, Icons.notifications_rounded, 'Activity'),
                _navItem(3, Icons.settings_outlined, Icons.settings_rounded, 'Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int i, IconData outline, IconData filled, String label) {
    final selected = _index == i;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => setState(() => _index = i),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(selected ? filled : outline,
                color: selected ? AppColors.navy : Colors.black38, size: 24),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? AppColors.navy : Colors.black38)),
          ],
        ),
      ),
    );
  }
}
