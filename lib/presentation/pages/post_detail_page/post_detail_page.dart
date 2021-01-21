import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/pages/post_detail_page/widgets/post_detail_body.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostDetailBody(),
    );
  }
}