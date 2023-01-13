import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_flutter_apps/models/post.dart';

class PostService {
  Future<List<Post>> loadPosts() async {
    final response = await http.get(Uri.parse('http://192.168.50.25:3004/posts'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}