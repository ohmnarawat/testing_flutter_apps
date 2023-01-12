import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_flutter_apps/models/post.dart';
import 'package:testing_flutter_apps/services/post_service.dart';
import 'package:testing_flutter_apps/widgets/post_list_widget.dart';

class MockPostService extends Mock implements PostService {}

void main() {
  final mockPostService = MockPostService();

  List<Post> generatePosts() => List<Post>.generate(
        100,
        (i) => Post(
          userId: i,
          id: i,
          title: 'post_${i}_title',
          body: 'post_${i}_body',
        ),
      );

  testWidgets('Post list scroll test', (tester) async {
    // mock post
    when(() => mockPostService.loadPosts())
        .thenAnswer((_) async => generatePosts());

    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PostListWidget(postService: mockPostService),
      ),
    ));
    // waiting for load posts (1 seconds)
    await tester.pump(const Duration(seconds: 1));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.text('post_50_title');

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
