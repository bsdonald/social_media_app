import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PostActorBloc>(context).add(GetPost(id: post.id));
        ExtendedNavigator.of(context).pushPostDetailPage();
      },
      child: Card(
        child: Container(
          height: 120,
          child: Center(
            child: Text(post.title),
          ),
        ),
      ),
    );
  }
}
