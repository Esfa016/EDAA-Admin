// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/AdminProfileSetting/AdminProfile_page.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import '/consts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class SeettingAdminProfile extends StatefulWidget {
  const SeettingAdminProfile({Key? key}) : super(key: key);

  @override
  _SeettingAdminProfileState createState() => _SeettingAdminProfileState();
}

class _SeettingAdminProfileState extends State<SeettingAdminProfile> {
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: dbContext.fetchProfile(FirebaseAuth.instance.currentUser!.uid.toString()),
          //stream: FirebaseFirestore.instance.collection('Admins').snapshots(),
          builder: (context,snapshot)
          {

            if(snapshot.hasError)
            {
              return Text('something went wrong');

            }
            else if(snapshot.hasData || snapshot.data!=null)
            {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index)
                {
                  QueryDocumentSnapshot<Object?> documentSnapshot = snapshot.data!.docs[index];
                  return Dismissible(

                      key: Key(index.toString()),
                      child: Card(
                        elevation: 4,
                        child: Center(
                          child: Container(
                            child:Column(
                              children: <Widget>[
                               Icon(Icons.person), SizedBox(width: 5,),Text((documentSnapshot!= null) ? (documentSnapshot['FullName']):''),
                                SizedBox(height: 10,),
                                Icon(Icons.email), SizedBox(width: 5,),  Text((documentSnapshot!= null) ? (documentSnapshot['Email']):''),
                                SizedBox(height: 10,),
                                Icon(Icons.password_rounded), SizedBox(width: 5,), Text((documentSnapshot!= null) ? (documentSnapshot['Password']):''),
                                SizedBox(height: 10,),
                                Icon(Icons.perm_identity), SizedBox(width: 5,),Text((documentSnapshot!= null) ? (documentSnapshot['Authid']):''),
                                SizedBox(height: 10,),

                              ],
                            )
                          ),
                        )
                        /*ListTile(


                          title: Text((documentSnapshot!= null) ? (documentSnapshot['FullName']):''),
                          trailing: Text((documentSnapshot!= null) ? (documentSnapshot['Email']):''),


                          ),*/

                        ),
                      );

                },

              );
            }
            else if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.red,
                  ),
                ),
              );
            }

            else return Text('Nulll');
          },



        )
    );
  }
}
