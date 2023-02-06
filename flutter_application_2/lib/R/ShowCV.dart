import 'package:flutter/material.dart';

class ShowPostedCv extends StatefulWidget {
  String _imgUrl;
  
  @override
  _ShowPostedCvState createState() => _ShowPostedCvState();

  ShowPostedCv({
    required String imgUrl,
  }) : _imgUrl = imgUrl;
}

class _ShowPostedCvState extends State<ShowPostedCv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(widget._imgUrl)),
      ),
    );
  }
}
