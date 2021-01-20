import 'package:social_media_app/domain/posts/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getPosts();
}