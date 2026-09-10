import 'package:flutter_dotenv/flutter_dotenv.dart';

/// AppConfig
/// -----------------------------------------------------------------------
/// Reads API keys from the local `.env` file at runtime — NEVER hardcode a
/// real key as a string literal anywhere in this codebase.
///
/// Setup:
///   1. Copy `.env.example` to `.env` in the project root.
///   2. Put your real keys in `.env` (this file is git-ignored).
///   3. `.env` is loaded once in main.dart via `await dotenv.load()`.
///
/// Production note: even this is only a step up from hardcoding — a
/// determined attacker can still extract secrets bundled into a shipped
/// app. For real production use, keys should live ONLY on your backend
/// server, and the app should call your backend, which then calls the
/// third-party API server-side. Treat `.env` as fine for development/
/// prototyping, not as the final security model.
/// -----------------------------------------------------------------------
class AppConfig {
  static String get breachCheckApiKey => dotenv.env['BREACH_CHECK_API_KEY'] ?? '';
  static String get lookupApiKey => dotenv.env['LOOKUP_API_KEY'] ?? '';
  static String get safeBrowsingApiKey => dotenv.env['SAFE_BROWSING_API_KEY'] ?? '';

  static bool get isConfigured =>
      breachCheckApiKey.isNotEmpty || lookupApiKey.isNotEmpty || safeBrowsingApiKey.isNotEmpty;
}
