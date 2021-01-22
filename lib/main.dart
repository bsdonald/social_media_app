import 'package:flutter/material.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/core/app_widget.dart';

Future<void> main() async {
  final PostRepository postRepository = PostRepository();
  runApp(AppWidget(postRepository: postRepository));
}
