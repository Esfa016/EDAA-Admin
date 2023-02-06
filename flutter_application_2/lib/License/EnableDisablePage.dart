import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/EnableDisable.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class EnableDisablePage extends StatefulWidget {
  @override
  _EnableDisablePageState createState() => _EnableDisablePageState();
}

class _EnableDisablePageState extends State<EnableDisablePage> {
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
              child: EnableDisable())),

    ],
    ),
    ),

    );
  }
}
