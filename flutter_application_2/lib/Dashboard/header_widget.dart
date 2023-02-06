// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '/AdminProfileSetting/AdminProfile_page.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import '/login_page.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              PopupMenuButton(
                icon: Icon(Icons.settings, color: AppColor.orange),
                color: AppColor.orange,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                onSelected: (int menu) {
                  if (menu == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminProfilePage()));
                  } else if (menu == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                            create: (context)=>DbContext(),
                            child: LoginPage())));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
