import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120,
        child: Center(
          child: Text('Post Title'),
        ),
      ),
    );
  }
}
