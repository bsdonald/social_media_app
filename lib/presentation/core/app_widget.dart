import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/application/post_watcher/post_watcher_bloc.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart' as app_router;

class AppWidget extends StatelessWidget {
  final PostRepository postRepository;

  const AppWidget({Key key, @required this.postRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostWatcherBloc(postRepository: postRepository)),
        BlocProvider(create: (context) => PostActorBloc(postRepository: postRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Social Media App",
        builder: ExtendedNavigator.builder(router: app_router.Router()),
      ),
    );
  }
}
