import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'package:social_media_app/domain/posts/post.dart';

class PostRepository implements IPostRepository {
  final String apiURL = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts(http.Client client) async {
    final response = await client.get(apiURL);
    List<Post> posts = postsFromJson(response.body);
    if (response.statusCode == 200) {
      return posts;
    } else {
      print('Failed!');
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Post> getPost(http.Client client, int id) async {
    final response = await client.get('$apiURL/$id');
    final retrievedPost = json.decode(response.body);
    Post post = Post.fromJson(retrievedPost);

    if (response.statusCode == 200) {
      return post;
    } else {
      print('Failed!');
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<Post> create({http.Client client, int id, int userId, String title, String body}) async {
    final response = await client.post(
      apiURL,
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      }),
    );
    Post post = Post.fromJson(jsonDecode(response.body));
    if (response.statusCode == 201) {
      print('success!');
      return post;
    } else {
      print('Failed!');
      throw Exception('Failed create post');
    }
  }

  @override
  Future<Post> update({http.Client client, int id, int userId, String title, String body}) async {
    final response = await client.put(
      '$apiURL/$id',
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      }),
    );
    Post post = Post.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print('success!');
      return post;
    } else {
      print('Failed!');
      throw Exception('Failed update post');
    }
  }

  @override
  Future delete(http.Client client, int id) async {
    final response = await client.delete('$apiURL/$id');

    if (response.statusCode == 200) {
      print('success!');
    } else {
      print('Failed!');
      throw Exception('Failed to delete post');
    }
  }
}
