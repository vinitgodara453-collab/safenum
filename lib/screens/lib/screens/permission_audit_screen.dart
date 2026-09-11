import 'package:flutter/material.dart';
import '../services/security_service.dart';

class PermissionAuditScreen extends StatefulWidget {
  const PermissionAuditScreen({super.key});

  @override
  State<PermissionAuditScreen> createState() => _PermissionAuditScreenState();
}

class _PermissionAuditScreenState extends State<PermissionAuditScreen> {
  List<AppPermissionSummary>? _apps;

  @override
  void initState() {
    super.initState();
    SecurityService.auditOwnDeviceApps().then((a) => setState(() => _apps = a));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Permission Audit')),
      body: _apps == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: _apps!.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final app = _apps![i];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.apps_outlined),
                    title: Text(app.appName),
                    subtitle: Text('Access: ${app.sensitivePermissions.join(', ')}'),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text('Review'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
