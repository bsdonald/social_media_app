import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart' as app_router;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social Media App",
      builder: ExtendedNavigator.builder(router: app_router.Router()),
    );
  }
}
