import 'package:social_media_app/domain/posts/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int id);
  Future<Post> create({int id, int userId, String title, String body});
  Future<Post> update({int id, int userId, String title, String body});
  Future<Post> delete(int id);
}
