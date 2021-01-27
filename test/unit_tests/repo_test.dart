import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

main() {
  group('getPosts', () {
    final postRepository = PostRepository();
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts')).thenAnswer((_) async => http.Response('[]', 200));

      expect(await postRepository.getPosts(client), isA<List<Post>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final postRepository = PostRepository();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts')).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(postRepository.getPosts(client), throwsException);
    });
  });
}
