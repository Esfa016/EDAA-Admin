// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import '/Dashboard/home_page.dart';

class AdminProfileHeaderWidget extends StatefulWidget {
  const AdminProfileHeaderWidget({Key? key}) : super(key: key);

  @override
  _AdminProfileHeaderWidgetState createState() =>
      _AdminProfileHeaderWidgetState();
}

class _AdminProfileHeaderWidgetState extends State<AdminProfileHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              // Interactivity or events codes here
            },
          ),
          Text(
            "Admin Profile",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
