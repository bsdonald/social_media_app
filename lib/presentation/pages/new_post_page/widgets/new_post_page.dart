import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: Container(
        child: Text('Hello World!'),
      ),
    );
  }
}
