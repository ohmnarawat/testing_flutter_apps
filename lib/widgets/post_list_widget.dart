import 'package:flutter/material.dart';
import 'package:testing_flutter_apps/models/post.dart';
import 'package:testing_flutter_apps/services/post_service.dart';

class PostListWidget extends StatefulWidget {
  final PostService postService;

  const PostListWidget({super.key, required this.postService});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = widget.postService.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                Post post = snapshot.data![index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
