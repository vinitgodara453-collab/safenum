import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class OnboardingScreen extends StatefulWidget {
  final Widget next;
  const OnboardingScreen({super.key, required this.next});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _Slide {
  final IconData icon;
  final String title;
  final String desc;
  const _Slide(this.icon, this.title, this.desc);
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  final _slides = const [
    _Slide(Icons.shield_outlined, 'Your number.\nYour data. Protected.',
        'SafeNum watches over your own number and device — nothing else, ever.'),
    _Slide(Icons.sim_card_alert_outlined, 'Real-time alerts',
        'Get notified the moment something looks wrong — breaches, SIM swaps, phishing links.'),
    _Slide(Icons.workspace_premium_rounded, 'Go Premium anytime',
        'Unlock full monitoring, a private vault, and priority support.'),
  ];

  void _finish() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget.next),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _finish,
                child: const Text('Skip', style: TextStyle(color: Colors.white70)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final s = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(colors: [AppColors.gold, AppColors.goldLight]),
                          ),
                          child: Icon(s.icon, size: 46, color: AppColors.navy),
                        ),
                        const SizedBox(height: 34),
                        Text(s.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800, height: 1.3)),
                        const SizedBox(height: 14),
                        Text(s.desc,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 14.5, height: 1.5)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _page == i ? 22 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: _page == i ? AppColors.gold : Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.navy,
                  ),
                  onPressed: () {
                    if (_page == _slides.length - 1) {
                      _finish();
                    } else {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                    }
                  },
                  child: Text(_page == _slides.length - 1 ? 'Get Started' : 'Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
