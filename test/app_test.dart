import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fsd_boilerplate/app/app.dart';

void main() {
  testWidgets('App builds and displays home page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Flutter FSD Boilerplate'), findsWidgets);
    expect(find.text('Feature-Sliced Design Architecture'), findsOneWidget);
    expect(find.byIcon(Icons.architecture), findsOneWidget);
  });
}
