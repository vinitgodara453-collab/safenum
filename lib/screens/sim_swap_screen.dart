import 'package:flutter/material.dart';
import '../services/security_service.dart';

class SimSwapScreen extends StatefulWidget {
  const SimSwapScreen({super.key});

  @override
  State<SimSwapScreen> createState() => _SimSwapScreenState();
}

class _SimSwapScreenState extends State<SimSwapScreen> {
  SimStatus? _status;

  @override
  void initState() {
    super.initState();
    SecurityService.getOwnSimSwapStatus().then((s) => setState(() => _status = s));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIM Swap Alert')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monitors your OWN line for unauthorized SIM reissues, using your carrier\'s official '
              'opt-in notification service. You\'ll get an instant push alert if it ever happens.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            if (_status == null)
              const Center(child: CircularProgressIndicator())
            else
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(
                        _status!.isSafe ? Icons.check_circle_outline : Icons.error_outline,
                        color: _status!.isSafe ? Colors.green : Colors.red,
                        size: 30,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(_status!.isSafe
                            ? 'No unauthorized SIM changes detected on your line.'
                            : 'Warning: a SIM change was detected. Contact your carrier immediately.'),
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
