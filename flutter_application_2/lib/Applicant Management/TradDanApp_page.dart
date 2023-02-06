// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import '/Applicant%20Management/ApplicantManagementConsole.dart';
import '/Applicant%20Management/TraditionalDancerApplicants.dart';
import '/R/Dash.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import '/side_bar_menu.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TraditionalDancerApplicantPage extends StatefulWidget {
  @override
  _TraditionalDancerApplicantPageState createState() => _TraditionalDancerApplicantPageState();
}

class _TraditionalDancerApplicantPageState extends State<TraditionalDancerApplicantPage> {
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
                  child: TraditionalDancerApplicants()),
            ),
          ],
        ),
      ),
    );
  }
}

