import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/application/post_watcher/post_watcher_bloc.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/pages/home_page/widgets/home_page_body.dart';
import 'package:social_media_app/presentation/pages/new_post_page/new_post_page.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: HomePageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.of(context).pushNewPostPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
