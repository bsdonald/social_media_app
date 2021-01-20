import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';

part 'post_watcher_event.dart';
part 'post_watcher_state.dart';

class PostWatcherBloc extends Bloc<PostWatcherEvent, PostWatcherState> {
  final IPostRepository postRepository;
  PostWatcherBloc({@required this.postRepository})
      : assert(postRepository != null),
        super(PostWatcherInitial());

  @override
  Stream<PostWatcherState> mapEventToState(
    PostWatcherEvent event,
  ) async* {
    if (event is GetPosts) {
      yield PostsLoadInProgress();
      try {
        final List<Post> posts = await postRepository.getPosts();
        yield PostsLoadSuccess(posts: posts);
      }
        catch (_) {
          yield PostsLoadFailure();
        }
    }
  }
}
