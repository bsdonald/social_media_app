import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'package:social_media_app/domain/posts/post.dart';

part 'post_watcher_event.dart';
part 'post_watcher_state.dart';

class PostWatcherBloc extends Bloc<PostWatcherEvent, PostWatcherState> {
  final IPostRepository postRepository;
  final client = http.Client();
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
        final List<Post> posts = await postRepository.getPosts(client);
        yield PostsLoadSuccess(posts: posts);
      }
        catch (_) {
          yield PostsLoadFailure();
        }
    }
  }
}
