import 'package:flutter/material.dart';
import '../services/security_service.dart';

class BreachCheckScreen extends StatefulWidget {
  const BreachCheckScreen({super.key});

  @override
  State<BreachCheckScreen> createState() => _BreachCheckScreenState();
}

class _BreachCheckScreenState extends State<BreachCheckScreen> {
  bool _loading = false;
  BreachResult? _result;

  Future<void> _runCheck() async {
    setState(() => _loading = true);
    final result = await SecurityService.checkOwnNumberForBreaches(
      ownVerifiedNumberHash: 'own_account_hash',
    );
    setState(() {
      _result = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breach Check')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checks only your own verified number and email against known data-leak databases.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            if (_result == null)
              ElevatedButton.icon(
                onPressed: _loading ? null : _runCheck,
                icon: _loading
                    ? const SizedBox(
                        width: 16, height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.search),
                label: Text(_loading ? 'Checking…' : 'Check my number & email'),
              )
            else
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(
                        _result!.wasFound ? Icons.warning_amber_rounded : Icons.check_circle_outline,
                        color: _result!.wasFound ? Colors.orange : Colors.green,
                        size: 30,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          _result!.wasFound
                              ? 'Found in ${_result!.sources.length} leak source(s). Change your passwords.'
                              : 'No breaches found for your number/email. Last checked ${_result!.lastChecked}.',
                        ),
                      ),
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
