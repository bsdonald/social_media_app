import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/pages/new_post_page/widgets/sm_text_form_field.dart';

class NewPostForm extends StatelessWidget {
  const NewPostForm({
    Key key,
    @required TextEditingController titleController,
    @required TextEditingController bodyController,
  })  : _titleController = titleController,
        _bodyController = bodyController,
        super(key: key);

  final TextEditingController _titleController;
  final TextEditingController _bodyController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      color: Colors.white,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SMTextFormField(
                controller: _titleController,
                hintText: 'Title',
              ),
              SMTextFormField(
                controller: _bodyController,
                hintText: 'Body',
              ),
            ],
          ),
        ),
      ),
    );
  }
}