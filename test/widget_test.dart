import 'package:flutter_test/flutter_test.dart';
import 'package:voiceflow/app/voiceflow_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('renders the Voiceflow CRM overview', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: VoiceflowApp()));
    await tester.pumpAndSettle();

    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Recent activity'), findsOneWidget);
  });
}
