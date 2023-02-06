import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/Certify.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class CertifyPage extends StatefulWidget {
  String uid;
  String fullName;
  String occupation;
  String email;
  String phone;
  String issueDate;
  String expireDate;
  String imgUrl;
  String address;
  String subCity;
  String woreda;
  String houseNumber;
  String status;
  @override
  _CertifyPageState createState() => _CertifyPageState();

  CertifyPage({
    required this.uid,
    required this.fullName,
    required this.occupation,
    required this.email,
    required this.phone,
    required this.issueDate,
    required this.expireDate,
    required this.imgUrl,
    required this.address,
    required this.subCity,
    required this.woreda,
    required this.houseNumber,
    required this.status,
  });
}

class _CertifyPageState extends State<CertifyPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                child: Certify(
                  fullName: widget.fullName,
                  occupation: widget.occupation,
                  email: widget.email,
                  phone: widget.phone,
                  issueDate: widget.issueDate,
                  expireDate: widget.expireDate,
                  imgUrl: widget.imgUrl,
                  uid: widget.uid,
                  subCity: widget.subCity,
                  address: widget.address,
                  woreda: widget.woreda,
                  houseNumber: widget.houseNumber,
                  status: widget.status,
                ),
              ),
            )],
        ),
      ),
    );;
  }
}
