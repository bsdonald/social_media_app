import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/pages/home_page/widgets/post_card.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PostCard(),
        );
      },
      itemCount: 3,
    );
  }
}
