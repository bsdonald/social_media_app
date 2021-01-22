// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/posts/post.dart';
import '../pages/edit_post_page/edit_post_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/new_post_page/new_post_page.dart';
import '../pages/post_detail_page/post_detail_page.dart';

class Routes {
  static const String homePage = '/';
  static const String newPostPage = '/new-post-page';
  static const String postDetailPage = '/post-detail-page';
  static const String editPostPage = '/edit-post-page';
  static const all = <String>{
    homePage,
    newPostPage,
    postDetailPage,
    editPostPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.newPostPage, page: NewPostPage),
    RouteDef(Routes.postDetailPage, page: PostDetailPage),
    RouteDef(Routes.editPostPage, page: EditPostPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(key: args.key),
        settings: data,
      );
    },
    NewPostPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NewPostPage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    PostDetailPage: (data) {
      final args = data.getArgs<PostDetailPageArguments>(
        orElse: () => PostDetailPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PostDetailPage(key: args.key),
        settings: data,
      );
    },
    EditPostPage: (data) {
      final args = data.getArgs<EditPostPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditPostPage(
          key: args.key,
          post: args.post,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushHomePage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.homePage,
        arguments: HomePageArguments(key: key),
      );

  Future<dynamic> pushNewPostPage() => push<dynamic>(Routes.newPostPage);

  Future<dynamic> pushPostDetailPage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.postDetailPage,
        arguments: PostDetailPageArguments(key: key),
      );

  Future<dynamic> pushEditPostPage({
    Key key,
    @required Post post,
  }) =>
      push<dynamic>(
        Routes.editPostPage,
        arguments: EditPostPageArguments(key: key, post: post),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}

/// PostDetailPage arguments holder class
class PostDetailPageArguments {
  final Key key;
  PostDetailPageArguments({this.key});
}

/// EditPostPage arguments holder class
class EditPostPageArguments {
  final Key key;
  final Post post;
  EditPostPageArguments({this.key, @required this.post});
}
