import 'package:flutter/material.dart';

class TextFieldWithLessNumber extends StatelessWidget {
  const TextFieldWithLessNumber(
      {required this.Name, required this.short, required this.hint, required this.mController});

  final String Name;
  final bool short;
  final String hint;
  final TextEditingController mController;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: short == true ? 60 : 150,
      child: TextField(
        controller: mController ,
        cursorColor: Color(0xFF082534),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.7)
                      : Color(0xFF082534).withOpacity(0.5))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.5)
                      : Color(0xFF082534))),
          labelText: Name,
          labelStyle: TextStyle(
              fontSize: 13,
              fontFamily: "Poppins",
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
