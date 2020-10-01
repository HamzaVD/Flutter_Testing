import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(home: child);
  }

  testWidgets('', (WidgetTester tester) async {
    LoginPage loginPage = LoginPage();
    await tester.pumpWidget(makeTestableWidget(child: loginPage));
  });
}
