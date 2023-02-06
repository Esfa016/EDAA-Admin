// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import '/Dashboard/dashboard.dart';
import '/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dash.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: ChangeNotifierProvider(
                create: (context)=> DbContext(),
                  child: SideBar()),
            ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: DashboardNew(),
            ),
          ],
        ),
      ),
    );
  }
}
