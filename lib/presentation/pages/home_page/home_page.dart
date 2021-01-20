import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_watcher/post_watcher_bloc.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/pages/home_page/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  final PostRepository postRepository = PostRepository();
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostWatcherBloc(postRepository: postRepository)..add(GetPosts()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: HomePageBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
