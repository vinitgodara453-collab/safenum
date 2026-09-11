import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class PasswordCheckScreen extends StatefulWidget {
  const PasswordCheckScreen({super.key});

  @override
  State<PasswordCheckScreen> createState() => _PasswordCheckScreenState();
}

class _PasswordCheckScreenState extends State<PasswordCheckScreen> {
  final _controller = TextEditingController();
  double _score = 0;
  String _label = 'Enter a password to check';
  bool _obscure = true;

  void _analyze(String value) {
    double score = 0;
    if (value.length >= 8) score += 0.25;
    if (value.length >= 12) score += 0.15;
    if (RegExp(r'[A-Z]').hasMatch(value)) score += 0.15;
    if (RegExp(r'[0-9]').hasMatch(value)) score += 0.15;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]').hasMatch(value)) score += 0.2;
    if (value.isEmpty) score = 0;
    setState(() {
      _score = score.clamp(0, 1);
      if (value.isEmpty) {
        _label = 'Enter a password to check';
      } else if (_score < 0.4) {
        _label = 'Weak — easy to guess';
      } else if (_score < 0.75) {
        _label = 'Moderate — could be stronger';
      } else {
        _label = 'Strong password';
      }
    });
  }

  Color get _color {
    if (_score < 0.4) return const Color(0xFFC0392B);
    if (_score < 0.75) return const Color(0xFFB98900);
    return AppColors.teal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Strength')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checked entirely on your device — nothing you type here is ever sent anywhere.',
              style: TextStyle(color: Colors.black54, fontSize: 12.5),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _controller,
              obscureText: _obscure,
              onChanged: _analyze,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: IconButton(
                  icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
            ),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _score,
                minHeight: 8,
                backgroundColor: Colors.black12,
                valueColor: AlwaysStoppedAnimation(_color),
              ),
            ),
            const SizedBox(height: 10),
            Text(_label, style: TextStyle(color: _color, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
