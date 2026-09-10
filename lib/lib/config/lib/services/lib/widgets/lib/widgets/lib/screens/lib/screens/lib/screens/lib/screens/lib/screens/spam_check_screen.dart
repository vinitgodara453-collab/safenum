import 'package:flutter/material.dart';
import '../services/security_service.dart';

class SpamCheckScreen extends StatefulWidget {
  const SpamCheckScreen({super.key});

  @override
  State<SpamCheckScreen> createState() => _SpamCheckScreenState();
}

class _SpamCheckScreenState extends State<SpamCheckScreen> {
  final _controller = TextEditingController();
  bool _loading = false;
  SpamCheckResult? _result;

  Future<void> _check() async {
    if (_controller.text.trim().isEmpty) return;
    setState(() => _loading = true);
    final result = await SecurityService.classifyIncomingCall(_controller.text.trim());
    setState(() {
      _result = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spam Call Check')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Paste an unknown incoming caller ID to see if the community has flagged it as spam or fraud. '
              'This only shows a spam/fraud label — never personal details about the caller.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Incoming caller ID',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: _loading ? null : _check,
              child: Text(_loading ? 'Checking…' : 'Check Caller'),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Caller: ${_result!.callerId}', style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(_result!.isLikelySpam ? 'Likely spam/fraud' : 'No spam reports found'),
                      Text('Category: ${_result!.category}', style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
