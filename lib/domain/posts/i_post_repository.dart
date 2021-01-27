import 'package:http/http.dart' as http;
import 'package:social_media_app/domain/posts/post.dart';


abstract class IPostRepository {
  Future<List<Post>> getPosts(http.Client client);
  Future<Post> getPost(http.Client client, int id);
  Future<Post> create({http.Client client, int id, int userId, String title, String body});
  Future<Post> update({http.Client client, int id, int userId, String title, String body});
  Future delete(http.Client client, int id);
}
