import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/layout/app_shell.dart';
import '../features/dashboard/presentation/dashboard_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(
          location: state.uri.path,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/',
            name: 'overview',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/contacts',
            name: 'contacts',
            builder: (context, state) => const _ComingSoonPage(title: 'Contacts'),
          ),
          GoRoute(
            path: '/calls',
            name: 'calls',
            builder: (context, state) => const _ComingSoonPage(title: 'Calls'),
          ),
          GoRoute(
            path: '/inbox',
            name: 'inbox',
            builder: (context, state) => const _ComingSoonPage(title: 'Inbox'),
          ),
          GoRoute(
            path: '/reports',
            name: 'reports',
            builder: (context, state) => const _ComingSoonPage(title: 'Reports'),
          ),
        ],
      ),
    ],
  );
});

class _ComingSoonPage extends StatelessWidget {
  const _ComingSoonPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title workspace',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
