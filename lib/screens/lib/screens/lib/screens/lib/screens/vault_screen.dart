import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultItem {
  final String title;
  final String masked;
  _VaultItem(this.title, this.masked);
}

class _VaultScreenState extends State<VaultScreen> {
  bool _unlocked = false;
  final _pinController = TextEditingController();
  final List<_VaultItem> _items = [
    _VaultItem('Bank recovery code', '•••• •••• 4821'),
    _VaultItem('Email backup codes', '•••• •••• •••• 09'),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_unlocked) return _lockScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Private Vault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline_rounded),
            onPressed: () => setState(() => _unlocked = false),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.navy,
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final item = _items[i];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: AppColors.navy.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 6))],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      color: AppColors.gold.withOpacity(0.12), borderRadius: BorderRadius.circular(11)),
                  child: const Icon(Icons.key_rounded, color: AppColors.gold, size: 18),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
                      Text(item.masked, style: const TextStyle(fontSize: 12, color: Colors.black45, letterSpacing: 1)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addItem() {
    setState(() => _items.add(_VaultItem('New entry', '•••• •••• ••••')));
  }

  Widget _lockScreen() {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [AppColors.gold, AppColors.goldLight])),
                child: const Icon(Icons.lock_rounded, color: AppColors.navy, size: 34),
              ),
              const SizedBox(height: 22),
              const Text('Vault Locked',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 6),
              Text('Enter your PIN to view your own private notes.',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12.5)),
              const SizedBox(height: 24),
              TextField(
                controller: _pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 6),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.08),
                  hintText: '• • • •',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, foregroundColor: AppColors.navy),
                  onPressed: () => setState(() => _unlocked = true),
                  child: const Text('Unlock'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
