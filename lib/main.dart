import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/root_shell.dart';
import 'screens/onboarding_screen.dart';

/// SAFENUM
/// -----------------------------------------------------------------------
/// PRIVACY-BY-DESIGN RULE (read this before adding any feature):
/// This app only ever reads/reports data that belongs to the DEVICE IT IS
/// INSTALLED ON. There is no screen, service, or API call anywhere in this
/// codebase that accepts "someone else's phone number" and returns
/// information about it. Every service in lib/services/ operates only on
/// the signed-in user's own number / own device. Keep it that way.
/// -----------------------------------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env not present yet — app still runs, real API calls just no-op.
  }
  runApp(const SafeNumApp());
}

class SafeNumApp extends StatelessWidget {
  const SafeNumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeNum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.navy,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.navy,
          secondary: AppColors.gold,
          tertiary: AppColors.teal,
        ),
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: AppColors.navy,
          titleTextStyle: TextStyle(
            color: AppColors.navy,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navy,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
      ),
      home: const OnboardingScreen(next: RootShell()),
    );
  }
}

/// Central premium color palette — deep navy + gold accent, used everywhere
/// instead of scattered hex codes so the whole app feels like one brand.
class AppColors {
  static const navy = Color(0xFF101A33);
  static const navyLight = Color(0xFF1B2B52);
  static const gold = Color(0xFFC9A24B);
  static const goldLight = Color(0xFFE8D394);
  static const teal = Color(0xFF0E7C66);
  static const bg = Color(0xFFF7F7FA);
}
