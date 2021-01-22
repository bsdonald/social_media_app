part of 'post_actor_bloc.dart';

abstract class PostActorState extends Equatable {
  const PostActorState();

  @override
  List<Object> get props => [];
}

class PostActorInitial extends PostActorState {}


//Get Post
class PostLoadSuccess extends PostActorState {
  final Post post;

  const PostLoadSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostLoadFailure extends PostActorState {}

class NetworkRequestInProgress extends PostActorState {}

class NetworkRequestSuccess extends PostActorState {}

class NetworkRequestFailure extends PostActorState {}
