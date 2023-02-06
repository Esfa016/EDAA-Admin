import 'package:flutter/material.dart';
import '/Event%20Management/Create_Events.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class CreateEventsPage extends StatefulWidget {
  @override
  _CreateEventsPageState createState() => _CreateEventsPageState();
}

class _CreateEventsPageState extends State<CreateEventsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
                  child: CreateEvents()),
            ),
          ],
        ),
      ),
    );;
  }
}
