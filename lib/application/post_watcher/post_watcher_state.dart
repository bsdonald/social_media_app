part of 'post_watcher_bloc.dart';

@immutable
abstract class PostWatcherState extends Equatable {
  const PostWatcherState();

  @override
  List<Object> get props => [];
}

class PostWatcherInitial extends PostWatcherState {}

class PostsLoadInProgress extends PostWatcherState {}

class PostsLoadSuccess extends PostWatcherState {
  final List<Post> posts;

  const PostsLoadSuccess({@required this.posts}) : assert(posts != null);

  @override
  List<Object> get props => [posts];
}

class PostsLoadFailure extends PostWatcherState {}
