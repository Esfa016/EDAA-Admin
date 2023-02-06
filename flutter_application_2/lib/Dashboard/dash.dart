// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import '/Dashboard/header_widget.dart';

import '/Dashboard/notification_card_widget.dart';
import 'package:provider/provider.dart';

import 'notify.dart';

class DashboardNew extends StatefulWidget {
  const DashboardNew({Key? key}) : super(key: key);

  @override
  _DashboardNewState createState() => _DashboardNewState();
}

class _DashboardNewState extends State<DashboardNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            ChangeNotifierProvider(
                              create: (context)=>DbContext(),
                                child: NotificationCardWidgetEdited()),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
