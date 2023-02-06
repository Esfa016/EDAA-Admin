// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class NotificationCardWidgetEdited extends StatefulWidget {
 // const NotificationCardWidgetEdited({Key? key}) : super(key: key);
  String traditional = "";


  @override
  State<NotificationCardWidgetEdited> createState() => _NotificationCardWidgetEditedState();
}

class _NotificationCardWidgetEditedState extends State<NotificationCardWidgetEdited> {
  @override
  Widget build(BuildContext context)  {
    final dbContext = Provider.of<DbContext>(context);

   // dbContext.countTraditionalDancerApplicants();
    return StreamBuilder<QuerySnapshot>(
      stream: dbContext.countTraditionalDancerApplicants(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
        else
          {
            return Container(

              decoration: BoxDecoration(
                color: AppColor.bgColor,
                  boxShadow:[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ] ,  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: 50,
                              color: AppColor.black,
                              fontFamily: 'Poppins'),
                          children: [
                            TextSpan(text: "Greetings!",
                              style: TextStyle(
                                fontSize:  screenWidth(context) < 1000? 20:40
                              )
                            ),

                          ],
                        ),
                      ),
                      Divider(

                      ),
                      SizedBox(
                        height: 50,
                      ),

                      Center(
                        child: Text(
                          'You have', style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize:  screenWidth(context) < 1000? 10:30,
                          color: AppColor.black,
                          height: 2.0,
                        ),),
                      ),

                      SizedBox( height: 20,),
                      snapshot.data!.docs.length.toString() != "0"?
                      Text(snapshot.data!.docs.length.toString() +' Traditional Dancer Applicant',
                        style: TextStyle(
                          fontSize:   screenWidth(context) < 1000? 5:20
                        ),
                      ):SizedBox(height: 0,),
                      SizedBox(
                        height: 40,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: dbContext.countModernDancerApplicants(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting)
                            {
                              return CircularProgressIndicator();
                            }
                          else
                            {

                              return
                                snapshot.data!.docs.length.toString() != "0"?
                                Text( snapshot.data!.docs.length.toString() +' Modern Dancer Applicant',style: TextStyle(
                                    fontSize:   screenWidth(context) < 1000? 5:20
                                ),):Container();
                            }

                        }
                      ),
                      SizedBox(height: 40,),
                      StreamBuilder<QuerySnapshot>(
                          stream: dbContext.countModernChoreographerApplicants(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting)
                            {
                              return CircularProgressIndicator();
                            }
                            else
                            {
                              return
                                snapshot.data!.docs.length.toString() != "0"?
                                Text( snapshot.data!.docs.length.toString() +' Modern Choreographer Applicants',
                                  style: TextStyle(
                                      fontSize:   screenWidth(context) < 1000? 5:20
                                  ),
                              ):Container();
                            }

                          }
                      ),
                      SizedBox(height: 40,),
                      StreamBuilder<QuerySnapshot>(
                          stream: dbContext.countTraditionalChoreographerApplicants(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting)
                            {
                              return CircularProgressIndicator();
                            }
                            else
                            {
                              return  snapshot.data!.docs.length.toString() != "0"?
                                Text( snapshot.data!.docs.length.toString() +' Traditional Choreographer Applicants',
                                  style: TextStyle(
                                      fontSize:   screenWidth(context) < 1000? 5:20
                                  ),
                                )
                                  :SizedBox(width: 0,);

                            }

                          }
                      ),
        // Text(
        // "Read More",
        // style: TextStyle(
        // fontSize: 14,
        // fontFamily: 'Poppins',
        // color: AppColor.white,
        // fontWeight: FontWeight.bold,
        // decoration: TextDecoration.underline),
        // ),
                    ],
                  ),
                ],
              ),
            );
          }

      }
    );
  }


}

class TextInfo extends StatelessWidget {
TextInfo({required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        color: AppColor.black,
        height: 2.0,
      ),
    );
  }
}
