import 'package:flutter/material.dart';

class SMTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SMTextFormField({
    Key key,
    @required this.hintText,
    @required this.controller,
  })  : assert(hintText != null),
        assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Theme.of(context).canvasColor,
        filled: true,
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}