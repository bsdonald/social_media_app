import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_watcher/post_watcher_bloc.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/presentation/pages/home_page/widgets/post_card.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostWatcherBloc, PostWatcherState>(
      builder: (context, state) {
        if (state is PostsLoadFailure) {
          return Text('failed');
        }
        if (state is PostsLoadSuccess) {
          List<Post> posts = state.posts;
          return ListView.builder(
            itemBuilder: (context, index) {
              Post post = posts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(post: post),
              );
            },
            itemCount: posts.length,
          );
        }
        if (state is PostsLoadInProgress) {
          return Container(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
