import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'package:social_media_app/domain/posts/post.dart';

part 'post_actor_event.dart';
part 'post_actor_state.dart';

class PostActorBloc extends Bloc<PostActorEvent, PostActorState> {
  final IPostRepository postRepository;
  PostActorBloc({@required this.postRepository})
      : assert(postRepository != null),
        super(PostActorInitial());
  @override
  Stream<PostActorState> mapEventToState(
    PostActorEvent event,
  ) async* {
    if (event is GetPost) {
      yield PostLoadInProgress();
      try {
        final Post post = await postRepository.getPost(event.id);
        yield PostLoadSuccess(post: post);
      } catch (_) {
        yield PostLoadFailure();
      }
    }
    if (event is CreatePost) {
      yield PostCreateInProgress();
      try {
        final Post post = await postRepository.create(
          id: event.id,
          userId: event.userId,
          title: event.title,
          body: event.body,
        );
        yield PostCreateSuccess(post: post);
      } catch (_) {
        yield PostCreateFailure();
      }
    }
  }
}