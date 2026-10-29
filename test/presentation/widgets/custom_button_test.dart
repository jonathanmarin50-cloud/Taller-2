import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomButton muestra texto y responde al tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Prueba',
            onPressed: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Prueba'), findsOneWidget);

    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
