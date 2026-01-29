import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fsd_boilerplate/app/app.dart';

void main() {
  testWidgets('App builds and displays home page', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Flutter FSD'), findsOneWidget);
    expect(find.text('Ready to build!'), findsOneWidget);
  });
}
