import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/presentation/pages/new_post_page/widgets/new_post_form.dart';
import 'package:social_media_app/presentation/routes/router.gr.dart';

class NewPostBody extends StatelessWidget {
  const NewPostBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _bodyController = TextEditingController();
    final _formKey = GlobalKey();
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
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NewPostForm(
                  key: _formKey,
                  titleController: _titleController,
                  bodyController: _bodyController,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_titleController.text != '' && _bodyController.text != '') {
                      BlocProvider.of<PostActorBloc>(context).add(
                        CreatePost(
                          id: 101,
                          userId: 1,
                          body: _bodyController.text,
                          title: _titleController.text,
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Please don't leave form blank"),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  },
                  child: Text('Create Post'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
