// This is a basic Flutter widget test for the login app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login_app/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginApp());

    // Verify that our login screen has key elements.
    expect(find.text('환영합니다!'), findsOneWidget);
    expect(find.text('계정에 로그인하세요'), findsOneWidget);
    expect(find.text('로그인'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // 이메일, 비밀번호 필드

    // Verify email and password fields are present
    expect(find.text('이메일'), findsOneWidget);
    expect(find.text('비밀번호'), findsOneWidget);
  });

  testWidgets('Login form validation test', (WidgetTester tester) async {
    await tester.pumpWidget(const LoginApp());

    // Find and tap the login button
    final loginButton = find.byType(ElevatedButton);
    await tester.ensureVisible(loginButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Should show validation errors
    expect(find.text('이메일을 입력해주세요'), findsOneWidget);
    expect(find.text('비밀번호를 입력해주세요'), findsOneWidget);
  });
}