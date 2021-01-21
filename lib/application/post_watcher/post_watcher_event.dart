part of 'post_watcher_bloc.dart';

@immutable
abstract class PostWatcherEvent extends Equatable {
  const PostWatcherEvent();

  @override
  List<Object> get props => [];
}

class GetPosts extends PostWatcherEvent {}
