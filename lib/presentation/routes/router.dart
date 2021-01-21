import 'package:auto_route/auto_route_annotations.dart';
import 'package:social_media_app/presentation/pages/home_page/home_page.dart';
import 'package:social_media_app/presentation/pages/new_post_page/new_post_page.dart';


@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: NewPostPage, fullscreenDialog: true),
  ],
)
class $Router {}
