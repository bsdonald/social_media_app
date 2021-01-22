import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/presentation/pages/post_detail_page/widgets/post_detail_body.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostActorBloc, PostActorState>(
      listener: (context, state) {
        if (state is NetworkRequestSuccess) {
          ExtendedNavigator.of(context).popUntil(
            (route) => route.settings.name == Routes.homePage,
          );
        }
        if (state is NetworkRequestFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Post delete failed'),
          ));
        }
      },
      builder: (context, state) {
        if (state is PostLoadFailure) {
          return Scaffold(
              appBar: AppBar(
                title: Text('ERROR'),
              ),
              body: Text('AN UNKNOWN ERROR OCCURRED'));
        }
        if (state is PostLoadSuccess) {
          Post post = state.post;
          return Scaffold(
            appBar: AppBar(
              title: Text(post.title),
              actions: [
                FlatButton(
                  child: Text('Edit'),
                  onPressed: () {
          ExtendedNavigator.of(context).pushEditPostPage(post: post);
                  },
                )
              ],
            ),
            body: PostDetailBody(post),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.delete_forever),
                onPressed: () {
                  BlocProvider.of<PostActorBloc>(context).add(DeletePost(id: post.id));
                  print(state);
                }),
          );
        }
        if (state is NetworkRequestInProgress) {
          return Scaffold(
            body: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}
