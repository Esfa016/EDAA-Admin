import 'package:flutter/material.dart';
import 'package:flutter_application_2/Event%20Management/UpdateEvents.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class UpdateEventPage extends StatefulWidget {
  String title;
  String img;
  String place;
  String description;
  String date;


  @override
  _UpdateEventPageState createState() => _UpdateEventPageState();

  UpdateEventPage({
    required this.title,
    required this.img,
    required this.place,
    required this.description,
    required this.date,
  });
}

class _UpdateEventPageState extends State<UpdateEventPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side Navigation Menu
            Expanded(
              child: SideBar(),
            ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: ChangeNotifierProvider(
                  create: (context)=>DbContext(),
                  child: UpdateEvent(place: widget.place,
                    img: widget.img,
                    description: widget.description ,
                    date: widget.date ,
                    title:  widget.title,

                  )),
            ),
          ],
        ),
      ),
    );;
  }
}
