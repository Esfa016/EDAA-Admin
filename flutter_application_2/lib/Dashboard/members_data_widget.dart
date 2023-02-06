// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '/app_colors.dart';

class MembersDataWidget extends StatefulWidget {
  const MembersDataWidget({Key? key}) : super(key: key);

  @override
  _MembersDataWidgetState createState() => _MembersDataWidgetState();
}

class _MembersDataWidgetState extends State<MembersDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Members Details",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: AppColor.bgColor,
                  fontSize: 22,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.orange,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: AppColor.orange,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              /// Table Header
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: AppColor.orange,
                    width: 2,
                  )),
                ),
                children: [
                  tableHeader("Full Name"),
                  tableHeader("ID"),
                  tableHeader("Category"),
                  tableHeader("Age"),
                  tableHeader("Gender"),
                  tableHeader("Email"),
                  tableHeader(""),
                ],
              ),

              /// Table Details
              tableRow(
                context,
                image: Image.asset("images/profilepic.png"),
                name: "Rebecca ",
                id: "100",
                category: "Trad-Dancer",
                age: "27",
                gender: "F",
                email: "rebecca@gmail",
                icons: Icons.delete,
              ),
              tableRow(
                context,
                image: Image.asset("images/profilepic.png"),
                name: "Samuel ",
                id: "200",
                category: "Mod-Dancer",
                age: "30",
                gender: "M",
                email: "samuel@gmail",
                icons: Icons.delete,
              ),
              tableRow(
                context,
                image: Image.asset("images/profilepic.png"),
                name: "Sammy ",
                id: "300",
                category: "Trad-Chereo",
                age: "33",
                gender: "M",
                email: "sammy@gmail",
                icons: Icons.delete,
              ),
              tableRow(
                context,
                image: Image.asset("images/profilepic.png"),
                name: "Yeab ",
                id: "400",
                category: "Mod-Chereo",
                age: "36",
                gender: "M",
                email: "yeab@gmail",
                icons: Icons.delete,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Showing 4 out of 4 Results",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TableRow tableRow(context,
    {image, name, id, category, age, gender, email, icons}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    ),
    children: [
      /// Full Name
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          children: [
            Hero(
                tag: "picture",
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/profilepic.png"),
                            fit: BoxFit.cover)))),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                child: Text(name),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ()));
                }),
          ],
        ),
      ),

      /// ID
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(id)
          ],
        ),
      ),

      /// Category
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(category)
          ],
        ),
      ),

      /// Age
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(age)
          ],
        ),
      ),

      /// Gender
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(gender)
          ],
        ),
      ),

      /// Email
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(email)
          ],
        ),
      ),

      /// delete
      Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(icons)
          ],
        ),
      ),
    ],
  );
}

Widget tableHeader(text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
    ),
  );
}
