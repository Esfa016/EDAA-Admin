import 'package:flutter/material.dart';
class CustomTextForm extends StatelessWidget {
  String name;
  CustomTextForm({required this.name});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(

      ),
      onSaved: (value)
      {

      },
    );
  }
}
