import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/pages/post_detail_page/widgets/post_detail_body.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostActorBloc, PostActorState>(
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
                  onPressed: null,
                )
              ],
            ),
            body: PostDetailBody(post),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.delete_forever),
              onPressed: null,
            ),
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
