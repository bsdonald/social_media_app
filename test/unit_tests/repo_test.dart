import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

class MockPost extends Mock implements Post {}

main() {
  group('getPosts', () {
    test('returns all posts if the http call completes successfully', () async {
      final client = MockClient();
      final postRepository = PostRepository();

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

  group('getPost', () {
    test('returns a post if the http call completes successfully', () async {
      final client = MockClient();
      final postRepository = PostRepository();
      final int id = 1;
      final mapJson = {'id': id};

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/$id')).thenAnswer((_) async => http.Response(json.encode(mapJson), 200));

      expect(await postRepository.getPost(client, id), isA<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final postRepository = PostRepository();
      final int id = 1;

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/$id')).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(postRepository.getPost(client, id), throwsException);
    });
  });

  group('create', () {
    test('uploads a new post if the http call completes successfully', () async {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();
      final mapJson = {
        'id': post.id,
        'userId': post.userId,
        'title': post.title,
        'body': post.body,
      };

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.post('https://jsonplaceholder.typicode.com/posts', body: jsonEncode(mapJson))).thenAnswer((_) async => http.Response(json.encode(mapJson), 201));

      expect(
          await postRepository.create(
            client: client,
            id: post.id,
            title: post.title,
            body: post.body,
            userId: post.userId,
          ),
          isA<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();
      final mapJson = {
        'id': post.id,
        'userId': post.userId,
        'title': post.title,
        'body': post.body,
      };

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.post('https://jsonplaceholder.typicode.com/posts', body: jsonEncode(mapJson))).thenAnswer((_) async => http.Response('Bad Request', 400));

      expect(
          postRepository.create(
            client: client,
            id: post.id,
            title: post.title,
            body: post.body,
            userId: post.userId,
          ),
          throwsException);
    });
  });
  group('update', () {
    test('updates a post if the http call completes successfully', () async {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();
      final mapJson = {
        'id': post.id,
        'userId': post.userId,
        'title': post.title,
        'body': post.body,
      };

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.put('https://jsonplaceholder.typicode.com/posts/${post.id}', body: jsonEncode(mapJson))).thenAnswer((_) async => http.Response(json.encode(mapJson), 200));

      expect(
          await postRepository.update(
            client: client,
            id: post.id,
            title: post.title,
            body: post.body,
            userId: post.userId,
          ),
          isA<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();
      final mapJson = {
        'id': post.id,
        'userId': post.userId,
        'title': post.title,
        'body': post.body,
      };

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.put('https://jsonplaceholder.typicode.com/posts/${post.id}', body: jsonEncode(mapJson))).thenAnswer((_) async => http.Response('Bad Request', 400));

      expect(
          postRepository.update(
            client: client,
            id: post.id,
            title: post.title,
            body: post.body,
            userId: post.userId,
          ),
          throwsException);
    });
  });
  group('delete', () {
    test('deletes a post if the http call completes successfully', () async {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();
      final mapJson = {'id': post.id};

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.delete('https://jsonplaceholder.typicode.com/posts/${post.id}')).thenAnswer((_) async => http.Response(json.encode(mapJson), 200));

      expect(await postRepository.delete(client, post.id), isA<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final postRepository = PostRepository();
      final post = MockPost();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.delete('https://jsonplaceholder.typicode.com/posts/${post.id}')).thenAnswer((_) async => http.Response('Bad Request', 400));

      expect(postRepository.delete(client, post.id), throwsException);
    });
  });
}
