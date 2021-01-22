import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/domain/posts/post.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart';

class EditPostBody extends StatelessWidget {
  final Post post;
  const EditPostBody({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController(text: post.body);
    return BlocConsumer<PostActorBloc, PostActorState>(
      listener: (context, state) {
        if (state is NetworkRequestSuccess) {
          ExtendedNavigator.of(context).popUntil(
            (route) => route.settings.name == Routes.homePage,
          );
        }
        if (state is NetworkRequestFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Post creation failed'),
          ));
        }
      },
      builder: (context, state) {
        if (state is NetworkRequestInProgress) {
          print(state);
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              Container(
                color: Colors.blue,
                // alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: TextFormField(
                      maxLines: 8,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).canvasColor,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_textEditingController.text != '') {
                    BlocProvider.of<PostActorBloc>(context).add(
                      UpdatePost(
                        id: post.id,
                        userId: post.userId,
                        body: _textEditingController.text,
                        title: post.title,
                      ),
                    );
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Please don't leave form blank"),
                    ));
                  }
                },
                child: Text('Edit Post'),
              ),
            ],
          ),
        );
      },
    );
  }
}
