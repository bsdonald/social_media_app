part of 'post_actor_bloc.dart';

abstract class PostActorState extends Equatable {
  const PostActorState();
  
  @override
  List<Object> get props => [];
}

class PostActorInitial extends PostActorState {}

//Get Post
class PostLoadInProgress extends PostActorState {}

class PostLoadSuccess extends PostActorState {
  final Post post;

  const PostLoadSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostLoadFailure extends PostActorState {}

//Create Post
class PostCreateInProgress extends PostActorState {}

class PostCreateSuccess extends PostActorState {
  final Post post;

  const PostCreateSuccess({@required this.post}) : assert(post != null);

  @override
  List<Object> get props => [post];
}

class PostCreateFailure extends PostActorState {}

// //Update Post
// class PostUpdateInProgress extends PostActorState{}

// class PostUpdateSuccess extends PostActorState{
//   final Post post;

//   const PostUpdateSuccess({@required this.post}) : assert(post != null);

//   @override
//   List<Object> get props => [post];
// }

// class PostUpdateFailure extends PostActorState{}

// //Delete Post
// class PostDeleteInProgress extends PostActorState{}

// class PostDeleteSuccess extends PostActorState{
//   final Post post;

//   const PostDeleteSuccess({@required this.post}) : assert(post != null);

//   @override
//   List<Object> get props => [post];
// }

// class PostDeleteFailure extends PostActorState{}
