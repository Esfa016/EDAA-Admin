import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Controllers%20and%20other%20stuff/Cont.dart';
import 'package:flutter_application_2/Honorary%20Members/HonoraryMember.dart';
import 'package:flutter_application_2/Honorary%20Members/Register.dart';
import 'package:flutter_application_2/Honorary%20Members/RegisterHonoraryMembers.dart';
import 'package:flutter_application_2/Honorary%20Members/RegisterPage.dart';
import 'package:flutter_application_2/Member%20Management/MemberConsolePage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../app_colors.dart';

class HonoraryMemberConsole extends StatefulWidget {
  TextEditingController search = TextEditingController();

  @override
  _HonoraryMemberConsoleState createState() => _HonoraryMemberConsoleState();
}

class _HonoraryMemberConsoleState extends State<HonoraryMemberConsole> {
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Material(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => DbContext(),
                                child: MemberConsolePage())));
                    // Interactivity or events codes here
                  },
                ),
                IconButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => DbContext(),
                                child: RegisterHonoraryPage())));
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: widget.search,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xFFEF8242),
                      ),
                    ),
                    hintText: 'Search for Honorary Members',
                    hintStyle: TextStyle(
                      color: Color(0xFFEF8242),
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        dbContext
                            .fetchHonoraryMembers(widget.search.text.trim());
                      },
                      icon: Icon(
                        Icons.search,
                        size: 22,
                      ),
                      color: Color(0xFFEF8242),
                    ),
                  ),
                ),
              ),
            ),



            StreamBuilder<QuerySnapshot>(
                stream:
                    dbContext.fetchHonoraryMembers(widget.search.text.trim()),
                //stream: FirebaseFirestore.instance.collection('Admins').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                    );
                  } else if (snapshot.data!.docs.length.toString() == "0") {
                    return Center(
                        child: Container(
                            child: Text(
                              'could not find Honorary Member',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            )));
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            QueryDocumentSnapshot<Object?> documentSnapshot =
                                snapshot.data!.docs[index];
                            return Dismissible(
                              key: Key(index.toString()),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                elevation: 10,
                                shadowColor: AppColor.orange,
                                // elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        documentSnapshot['imgUrl']),
                                  ),
                                  title: Text(
                                    documentSnapshot['fullName'],
                                    style: TextStyle(
                                      color: AppColor.orange,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),

                                  subtitle: Text(
                                    documentSnapshot['occupation'],
                                    style: TextStyle(
                                      color: AppColor.orange,
                                    ),
                                  ),
                                  //selected: true,
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => MemberProfile()));
                                  },
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete_forever_outlined),
                                    onPressed: (){
                                      Alert(context: context,
                                      title: 'Are you sure',
                                        desc: 'Remove this memeber?',
                                        type: AlertType.warning,
                                        buttons: [
                                          DialogButton(child: Text('Remove'), onPressed: (){
                                            dbContext.removeHonoraryMember(documentSnapshot['email'])
                                                .then((value) => {
                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                                   create: (context)=>DbContext(),
                                                   child: HonoraryMember())))
                                            });
                                          })
                                        ]
                                      ).show();
                                    },

                                    )
                                  ),
                                ),
                              );

                          }),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                    );
                  } else if (snapshot.data == null) {
                    return Text('Could not find the honorary member');
                  } else {
                    return Text('Something went wrong...try again');
                  }
                }),

          ],
        ),
      ),
    );
  }

}
