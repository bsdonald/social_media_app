part of 'post_actor_bloc.dart';

abstract class PostActorEvent extends Equatable {
  const PostActorEvent();

  @override
  List<Object> get props => [];
}

//Get Post
class GetPost extends PostActorEvent {
  final int id;

  const GetPost({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

//CreatePost
class CreatePost extends PostActorEvent {
  final int id;
  final int userId;
  final String title;
  final String body;

  const CreatePost({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body, int creatorId,
  })  : assert(id != null),
        assert(userId != null),
        assert(title != null),
        assert(body != null);

  @override
  List<Object> get props => [
        id,
        userId,
        title,
        body,
      ];
}

// //UpdatePost
// class UpdatePost extends PostActorEvent {}

// //Delete Post
// class DeletePost extends PostActorEvent {}
