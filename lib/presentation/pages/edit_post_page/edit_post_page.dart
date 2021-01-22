import 'package:flutter/material.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/presentation/pages/edit_post_page/widgets/edit_post_body.dart';

class EditPostPage extends StatelessWidget {
  final Post post;
  const EditPostPage({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: EditPostBody(post: post),
    );
  }
}
