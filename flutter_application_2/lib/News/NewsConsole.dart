import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/News.dart';
import 'package:flutter_application_2/News/NewsConsolePage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../News/AddNewsPage.dart';
import '../app_colors.dart';

class NewsConsole extends StatefulWidget {
  TextEditingController search = TextEditingController();

  @override
  _NewsConsoleState createState() => _NewsConsoleState();
}

class _NewsConsoleState extends State<NewsConsole> {
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   "Members Details",
                  //   style: TextStyle(
                  //     fontFamily: 'Poppins',
                  //     fontWeight: FontWeight.bold,
                  //     color: AppColor.bgColor,
                  //     fontSize: 22,
                  //   ),
                  // ),

                  // Container(
                  //   height: 200,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //       color: AppColor.orange,
                  //       borderRadius: BorderRadius.circular(100)),
                  //   padding: EdgeInsets.symmetric(
                  //     vertical: 10,
                  //     horizontal: 20,
                  //   ),
                  //   /*child: Text(
                  //     "View All",
                  //     style: TextStyle(
                  //       fontFamily: 'Poppins',
                  //       fontWeight: FontWeight.bold,
                  //       color: AppColor.black,
                  //     ),
                  //   ),*/
                  // ),
                ],
              ),
              // Divider(
              //   thickness: 2,
              //   color: AppColor.orange,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: 'Search '
              //   ),
              //   controller: widget.search,
              // ),
              // ElevatedButton(
              //   onPressed: (){
              //     dbContext.fetchTraditonalDancerApplinants(widget.search.text.trim());
              //   }, child: Text('Search'),
              // ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.arrow_b),
                    //   onPressed: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(create: (context)=>DbContext() ,child: AddNewsPage())));
                    //     // Interactivity or events codes here
                    //   },
                    // ),
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
                            hintText: 'Search News',
                            hintStyle: TextStyle(
                              color: Color(0xFFEF8242),
                              fontSize: 17,
                              fontFamily: 'Poppins',
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                dbContext.fetchNews(widget.search.text.trim());
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
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Container(
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                              create: (context) => DbContext(),
                                              child: AddNewsPage())));
                            },
                            child: Icon(Icons.add)),
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: dbContext.fetchNews(widget.search.text.trim()),
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
                        'could not find News!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      )));
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            //scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              QueryDocumentSnapshot<Object?> documentSnapshot =
                                  snapshot.data!.docs[index];
                              return Dismissible(
                                key: Key(index.toString()),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  elevation: 10,
                                  shadowColor: AppColor.orange,
                                  child: ListTile(
                                    // leading:
                                    title: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(
                                              documentSnapshot['imgUrl']),
                                        ),
                                        SizedBox(width: 10),
                                        // CircleAvatar(
                                        //   backgroundImage: NetworkImage(documentSnapshot['imgUrl']),
                                        // ),
                                        Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot['NewsTitle'])
                                              : '',
                                          style: TextStyle(
                                            color: AppColor.orange,
                                          ),
                                          textScaleFactor: 1.5,
                                        ),
                                        //   Text((documentSnapshot!= null) ? (documentSnapshot['NewsDescription']):''),
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showEditDialogFunction(
                                                context,
                                                documentSnapshot['imgUrl'],
                                                documentSnapshot['NewsTitle'],
                                                documentSnapshot[
                                                    'NewsDescription']);
                                            // showDialogFunction(context,documentSnapshot['imgUrl'], documentSnapshot['NewsTitle'], documentSnapshot['NewsDescription']);
                                            // print(documentSnapshot['userID'].toString());
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDeleteDialogFunction(
                                                context,
                                                documentSnapshot['imgUrl'],
                                                documentSnapshot['NewsTitle'],
                                                documentSnapshot[
                                                    'NewsDescription']);
                                            // print(documentSnapshot['userID'].toString());
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
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
                    } else if (widget.search.text.isEmpty) {
                      return Text('Please enter name of the applicant');
                    } else {
                      return Text('Something went wrong...try again');
                    }
                  }),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  showDeleteDialogFunction(context, img, title, desc) {
    return showDialog(
        context: context,
        builder: (context) {
          final saverImage = img;
          final saverTitle = title;
          final saverDesc = desc;
          final dbContext = DbContext();
          TextEditingController titleController = TextEditingController();
          TextEditingController descController = TextEditingController();
          titleController.text = title;
          descController.text = desc;
          String myPath = "";
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                //  width: MediaQuery.of(context).size.width * 0.7,
                width: 400,
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        FileUploadInputElement input = FileUploadInputElement()
                          ..accept = "image/*";
                        input.click();
                        input.onChange.listen((event) {
                          final file = input.files?.first;
                          String fileName = file!.name;
                          final reader = FileReader();
                          reader.readAsDataUrl(file!);
                          reader.onLoadEnd.listen((event) async {
                            // FirebaseStorage.instance.ref().child('News/$mDate')
                            //     .putBlob(file).then((p0) => print('success'))
                            //     .catchError((onError)=>print('$onError'));
                            //TaskSnapshot snapshot = await dbContext.uploadNewsImage(file);
                            // widget.imgPath = dbContext.uploadNewsImage(file);
                            UploadTask mTask = FirebaseStorage.instance
                                .ref()
                                .child('News/$fileName')
                                .putBlob(file);
                            TaskSnapshot snapshot = await mTask;
                            snapshot.ref
                                .getDownloadURL()
                                .then((value) => setState(() {
                                      myPath = value;
                                    }));

                            //  print(widget.imgPath.toString());
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          img,
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Description'),
                        controller: descController,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Center(
                        child: Container(
                      color: Colors.red,
                      child: ElevatedButton(
                          onPressed: () {
                            Alert(
                                context: context,
                                title: 'Are you sure',
                                desc:
                                    'Are you sure you want to delete this news!',
                                type: AlertType.warning,
                                buttons: [
                                  DialogButton(
                                      child: Text('Delete'),
                                      onPressed: () {
                                        News myNews = News(
                                            imgUrl: img,
                                            newsTitle:
                                                titleController.text.trim(),
                                            newsDescription:
                                                descController.text.trim(),
                                            createdAt: Timestamp.now());
                                        dbContext
                                            .removeNews(myNews)
                                            .then((value) => {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChangeNotifierProvider(
                                                                  create: (context) =>
                                                                      DbContext(),
                                                                  child:
                                                                      NewsConsolePage())))
                                                });
                                      }),
                                ]).show();
                          },
                          child: Text('Delete')),
                    )),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showEditDialogFunction(context, img, title, desc) {
    return showDialog(
        context: context,
        builder: (context) {
          final saverTitle = title;

          final dbContext = DbContext();
          TextEditingController titleController = TextEditingController();
          TextEditingController descController = TextEditingController();
          titleController.text = title;
          descController.text = desc;
          String myPath = img;
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                //  width: MediaQuery.of(context).size.width * 0.7,
                width: 400,
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        FileUploadInputElement input = FileUploadInputElement()
                          ..accept = "image/*";
                        input.click();
                        input.onChange.listen((event) {
                          final file = input.files?.first;
                          String fileName = file!.name;
                          final reader = FileReader();
                          reader.readAsDataUrl(file!);
                          reader.onLoadEnd.listen((event) async {
                            UploadTask mTask = FirebaseStorage.instance
                                .ref()
                                .child('News/$fileName')
                                .putBlob(file);
                            TaskSnapshot snapshot = await mTask;
                            snapshot.ref
                                .getDownloadURL()
                                .then((value) => setState(() {
                                      img = value.toString();
                                    }));

                            print(myPath.toString());
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(img),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Title',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.orange))),
                        controller: titleController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Description',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.orange))),
                        controller: descController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Container(
                      color: Colors.red,
                      child: ElevatedButton(
                          onPressed: () {
                            News myNews = News(
                                imgUrl: img,
                                newsTitle: titleController.text.trim(),
                                newsDescription: descController.text.trim(),
                                createdAt: Timestamp.now());
                            dbContext
                                .updateNews(myNews, saverTitle)
                                .then((value) => {
                                      Alert(
                                              context: context,
                                              title: 'Successful',
                                              desc: 'Update Successful',
                                              type: AlertType.success)
                                          .show()
                                          .then((value) => {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChangeNotifierProvider(
                                                              create: (context) =>
                                                                  DbContext(),
                                                              child:
                                                                  NewsConsolePage(),
                                                            )))
                                              })
                                    });
                          },
                          child: Text('Update')),
                    )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
