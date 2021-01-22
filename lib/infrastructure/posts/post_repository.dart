import 'package:flutter/semantics.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'dart:convert';

import 'package:social_media_app/domain/posts/post.dart';

class PostRepository implements IPostRepository {
  final String apiURL = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(apiURL);
    List<Post> posts = postsFromJson(response.body);
    if (response.statusCode == 200) {
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Post> getPost(int id) async {
    final response = await http.get('$apiURL/$id');
    final retrievedPost = json.decode(response.body);
    Post post = Post.fromJson(retrievedPost);

    if (response.statusCode == 200) {
      return post;
    } else {
      throw Exception('Failed to load post');
    }
      }

  @override
  Future<Post> create({int id, int userId, String title, String body}) async {
    final response = await http.post(
      apiURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      }),
    );
    Post post = Post.fromJson(jsonDecode(response.body));
    if (response.statusCode == 201) {
    return post;
  } else {
    throw Exception('Failed create post');
  }
  }
}
