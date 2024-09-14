import 'package:flutter/material.dart';
import 'package:flutter_first_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Botón flotante agrega tarea', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomePage()),
      ),
    );

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Nueva tarea'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Tarea de prueba');
    await tester.tap(find.text('Guardar'));
    await tester.pump();

    expect(find.text('Tarea de prueba'), findsOneWidget);
  });

  testWidgets('Eliminar tarea completada', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomePage()),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'Tarea para eliminar');
    await tester.tap(find.text('Guardar'));
    await tester.pump();

    final checkbox = find.byType(Checkbox).first;
    await tester.tap(checkbox);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text('Tarea para eliminar'), findsNothing);
  });
}
