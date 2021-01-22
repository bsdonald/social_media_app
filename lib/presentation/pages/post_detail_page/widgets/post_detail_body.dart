import 'package:flutter/material.dart';
import 'package:social_media_app/domain/posts/post.dart';

class PostDetailBody extends StatelessWidget {
  final Post post;
  const PostDetailBody(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 24),
          Container(
            color: Colors.blue,
            // alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(post.body),
            ),
          ),
        ],
      ),
    );
  }
}
