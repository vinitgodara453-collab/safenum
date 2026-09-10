/// SecurityService
/// -----------------------------------------------------------------------
/// Every method here takes NO "target phone number" parameter. That is
/// intentional. This service can only ever act on:
///   - the number the CURRENT signed-in user registered with, or
///   - permissions/apps already installed on THIS device.
///
/// If you're tempted to add a method like `lookupNumber(String otherNumber)`
/// — don't. That is exactly the stalkerware pattern this app refuses to be.
/// -----------------------------------------------------------------------
class SecurityService {
  static Future<BreachResult> checkOwnNumberForBreaches({
    required String ownVerifiedNumberHash,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const BreachResult(
      wasFound: false,
      sources: [],
      lastChecked: 'just now',
    );
  }

  static Future<SpamCheckResult> classifyIncomingCall(String callerId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return SpamCheckResult(
      callerId: _maskNumber(callerId),
      isLikelySpam: false,
      reportCount: 0,
      category: 'Unclassified',
    );
  }

  static Future<SimStatus> getOwnSimSwapStatus() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const SimStatus(
      isSafe: true,
      lastSwapDetectedAt: null,
    );
  }

  static Future<List<AppPermissionSummary>> auditOwnDeviceApps() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      AppPermissionSummary(appName: 'Maps', sensitivePermissions: ['Location']),
      AppPermissionSummary(appName: 'Chat App', sensitivePermissions: ['Contacts', 'Mic']),
    ];
  }

  static String _maskNumber(String number) {
    if (number.length < 4) return number;
    return '${'x' * (number.length - 4)}${number.substring(number.length - 4)}';
  }
}

class BreachResult {
  final bool wasFound;
  final List<String> sources;
  final String lastChecked;
  const BreachResult({
    required this.wasFound,
    required this.sources,
    required this.lastChecked,
  });
}

class SpamCheckResult {
  final String callerId;
  final bool isLikelySpam;
  final int reportCount;
  final String category;
  const SpamCheckResult({
    required this.callerId,
    required this.isLikelySpam,
    required this.reportCount,
    required this.category,
  });
}

class SimStatus {
  final bool isSafe;
  final DateTime? lastSwapDetectedAt;
  const SimStatus({required this.isSafe, this.lastSwapDetectedAt});
}

class AppPermissionSummary {
  final String appName;
  final List<String> sensitivePermissions;
  const AppPermissionSummary({
    required this.appName,
    required this.sensitivePermissions,
  });
}
