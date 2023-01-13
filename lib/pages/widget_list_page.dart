import 'package:flutter/material.dart';
import 'package:testing_flutter_apps/pages/counter_page.dart';
import 'package:testing_flutter_apps/pages/todo_list_page.dart';
import 'package:testing_flutter_apps/services/post_service.dart';
import 'package:testing_flutter_apps/widgets/message_widget.dart';
import 'package:testing_flutter_apps/widgets/post_list_widget.dart';

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MENU'),
      ),
      body: ListView(
        children: [
          TextButton(
            child: const Text('Message Widget'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MessagePage()));
            },
          ),
          TextButton(
            child: const Text('Post List Widget'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PostListPage()));
            },
          ),
          TextButton(
            child: const Text('Counter Page'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (_) => const CounterPage(title: 'Counter')));
            },
          ),
          TextButton(
            child: const Text('Todo List Page'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TodoListPage()));
            },
          ),
        ],
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Widget'),
      ),
      body: const MessageWidget(
          title: 'Example Title', message: 'Example Message'),
    );
  }
}

class PostListPage extends StatelessWidget {
  PostListPage({super.key});

  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List Widget'),
      ),
      body: PostListWidget(postService: _postService),
    );
  }
}
