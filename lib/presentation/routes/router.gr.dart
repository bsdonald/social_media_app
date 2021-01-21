// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/home_page/home_page.dart';
import '../pages/new_post_page/new_post_page.dart';
import '../pages/post_detail_page/post_detail_page.dart';

class Routes {
  static const String homePage = '/';
  static const String newPostPage = '/new-post-page';
  static const String postDetailPage = '/post-detail-page';
  static const all = <String>{
    homePage,
    newPostPage,
    postDetailPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.newPostPage, page: NewPostPage),
    RouteDef(Routes.postDetailPage, page: PostDetailPage),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PostDetailPage(),
        settings: data,
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

  Future<dynamic> pushPostDetailPage() => push<dynamic>(Routes.postDetailPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  HomePageArguments({this.key});
}
