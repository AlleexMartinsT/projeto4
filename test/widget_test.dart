import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/main.dart';

void main() {
  testWidgets('Testes do contador', (WidgetTester tester) async {
    // Construir o app e dispare um frame.
    await tester.pumpWidget(MyApp());

    // Verifique se o contador começa em 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Toque no ícone '+' e dispare um frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifique se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
