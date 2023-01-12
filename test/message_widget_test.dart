import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter_apps/widgets/message_widget.dart';

void main() {
  testWidgets('MessageWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MessageWidget(title: 'Title', message: 'Message'),
        ),
      ),
    );

    // Create the finders
    final titleFinder = find.text('Title');
    final messageFinder = find.text('Message');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
