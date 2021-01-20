import 'dart:convert';

List<Post> postsFromJson(String str) =>
  List<Post>.from(json.decode(str).map((x) =>
    Post.fromJson(x)));


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}