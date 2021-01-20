import 'package:flutter/material.dart';
import 'package:social_media_app/domain/posts/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120,
        child: Center(
          child: Text(post.title),
        ),
      ),
    );
  }
}
