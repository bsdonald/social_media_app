import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:social_media_app/domain/posts/i_post_repository.dart';
import 'package:social_media_app/domain/posts/post.dart';

part 'post_actor_event.dart';
part 'post_actor_state.dart';

class PostActorBloc extends Bloc<PostActorEvent, PostActorState> {
  final IPostRepository postRepository;
  final client = http.Client();

  PostActorBloc({@required this.postRepository})
      : assert(postRepository != null),
        super(PostActorInitial());
  @override
  Stream<PostActorState> mapEventToState(
    PostActorEvent event,
  ) async* {
    if (event is GetPost) {
      yield NetworkRequestInProgress();
      try {
        final Post post = await postRepository.getPost(client, event.id);
        yield PostLoadSuccess(post: post);
      } catch (_) {
        yield PostLoadFailure();
      }
    }
    if (event is CreatePost) {
      yield NetworkRequestInProgress();
      try {
        await postRepository.create(
          client: client,
          id: event.id,
          userId: event.userId,
          title: event.title,
          body: event.body,
        );
        yield NetworkRequestSuccess();
      } catch (_) {
        yield NetworkRequestFailure();
      }
    }
    if (event is UpdatePost) {
      yield NetworkRequestInProgress();
      try {
        await postRepository.update(
          client: client,
          id: event.id,
          userId: event.userId,
          title: event.title,
          body: event.body,
        );
        yield NetworkRequestSuccess();
      } catch (_) {
        yield NetworkRequestFailure();
      }
    }
    if (event is DeletePost) {
      yield NetworkRequestInProgress();
      try {
        await postRepository.delete(client, event.id);
        yield NetworkRequestSuccess();
      } catch (_) {
        yield NetworkRequestFailure();
      }
    }
  }
}
