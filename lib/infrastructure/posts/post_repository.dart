import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'dart:convert';

import 'package:social_media_app/domain/posts/post.dart';


class PostRepository implements IPostRepository {
  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    List<Post> posts = postsFromJson(response.body);
    if (response.statusCode == 200) {
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}