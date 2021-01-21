import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/pages/new_post_page/widgets/new_post_body.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: NewPostBody(),
    );
  }
}
