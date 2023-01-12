import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    // Build an App with a Text widget that displays the letter 'Testing Flutter apps'.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Testing Flutter apps'),
      ),
    ));

    // Find a widget that displays the letter 'Testing Flutter apps'.
    expect(find.text('Testing Flutter apps'), findsOneWidget);
  });

  testWidgets('finds a widget using a Key', (tester) async {
    // Define the test key.
    const testKey = Key('test_key');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a widget using a Type', (tester) async {
    // Build a MaterialApp with a ListView.
    await tester.pumpWidget(MaterialApp(home: ListView()));

    // Find the ListView widget using Scrollable.
    expect(find.byType(Scrollable), findsOneWidget);
  });

  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('finds a widget using a Icon', (tester) async {
    // Build an App with a Icon widget.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {},
        ),
      ),
    ));

    // Find the widget using Icons.add.
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
