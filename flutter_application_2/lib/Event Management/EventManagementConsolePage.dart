import 'package:flutter/material.dart';
import 'package:flutter_application_2/Event%20Management/EventManagementConsole.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class EventManagementConsolePage extends StatefulWidget {
  @override
  _EventManagementConsolePageState createState() => _EventManagementConsolePageState();
}

class _EventManagementConsolePageState extends State<EventManagementConsolePage> {
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
                  child: EventManagementConsole()),
            ),
          ],
        ),
      ),
    );;
  }
}
