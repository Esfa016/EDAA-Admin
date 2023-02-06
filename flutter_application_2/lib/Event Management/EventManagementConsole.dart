import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '/Event%20Management/EventManagementConsolePage.dart';
import '/Event%20Management/UpdateEventPage.dart';
import '/Models/Events.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../app_colors.dart';
import 'Create_Events_Page.dart';
import 'UpdateEvents.dart';

class EventManagementConsole extends StatefulWidget {
  TextEditingController search = TextEditingController();

  @override
  _EventManagementConsoleState createState() => _EventManagementConsoleState();
}

class _EventManagementConsoleState extends State<EventManagementConsole> {
  TextEditingController mDate = TextEditingController();
  DateTime sDate = DateTime.now();

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
                children: [],
              ),

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
                            hintText: 'Search Events',
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
                                              child: CreateEventsPage())));
                            },
                            child: Icon(Icons.add)),
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: dbContext.fetchEvents(widget.search.text.trim()),
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
                                'could not find event!',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              )));
                    }
                    else if (snapshot.hasData || snapshot.data != null) {
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
                                              documentSnapshot['ImgUrl']),
                                        ),
                                        SizedBox(width: 10),
                                        // CircleAvatar(
                                        //   backgroundImage: NetworkImage(documentSnapshot['imgUrl']),
                                        // ),
                                        Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot['EventTitle'])
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
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                            //     create: (context)=>DbContext(),
                                            //     child: UpdateEventPage(title:  documentSnapshot['EventTitle'], img: documentSnapshot['ImgUrl'], place: documentSnapshot['EventPlace'], description: documentSnapshot['EventDescription'], date: documentSnapshot['Date']))));
                                            showEditDialogFunction(
                                                context,
                                                documentSnapshot['ImgUrl'],
                                                documentSnapshot['EventTitle'],
                                                documentSnapshot['EventDescription'],
                                                documentSnapshot['EventPlace'],
                                                documentSnapshot['Date']);
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
                                                documentSnapshot['ImgUrl'],
                                                documentSnapshot['EventTitle'],
                                                documentSnapshot['EventDescription'],
                                                documentSnapshot['EventPlace'],
                                                documentSnapshot['CreatedAt'],
                                                documentSnapshot['Date']);
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
                    }
                    else {
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

  showEditDialogFunction(context, img, title, desc, place, date) {
    return showDialog(
        context: context,
        builder: (context) {
          final saverTitle = title;

          final dbContext = DbContext();
          TextEditingController titleController = TextEditingController();
          TextEditingController descController = TextEditingController();
          titleController.text = title;
          descController.text = desc;
          TextEditingController placeController = TextEditingController();
          placeController.text = place;

          mDate.text = date;
          // String myPath=img;
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
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
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
                                .child('Events/$fileName')
                                .putBlob(file);
                            TaskSnapshot snapshot = await mTask;
                            snapshot.ref
                                .getDownloadURL()
                                .then((value) => setState(() {
                                      img = value.toString();
                                    }));

                            print(img.toString());
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(img),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Title',border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.orange
                            )
                        )),
                        controller: titleController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Description',border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.orange
                            )
                        )),
                        controller: descController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Event Place',border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.orange
                            )
                        )),
                        controller: placeController,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 50.0,
                      child: RaisedButton(
                        color: Color(0xFFEF8242),
                        textColor: Colors.white,
                        onPressed: () {
                          pickDateTime(context);
                        },
                        child: Text(mDate.text.trim(),
                            style:
                                TextStyle(fontSize: 15, fontFamily: 'Poppins')),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFFEF8242))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xFFEF8242))),
                          color: Color(0xFFEF8242),
                          textColor: Colors.white,

                          onPressed: () {
                            Event myEvent = Event(
                                imgUrl: img,
                                eventTitle: titleController.text.trim(),
                                eventDescription: descController.text.trim(),
                                eventPlace: placeController.text.trim(),
                                date: sDate.toString(),
                                createdAt: Timestamp.now());
                            dbContext.updateEvents(myEvent, saverTitle).then((value) => {
                              Alert(context: context,title: 'Successful',desc: 'Update Successful',type: AlertType.success).show().then((value) => {

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                  create:(context)=>DbContext(),
                                  child: EventManagementConsolePage(
                                  ),
                                )))
                              })
                            });
                          },
                          child: Text('Update', style: TextStyle(
                              fontSize: 15, fontFamily: 'Poppins'))),
                    )),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: sDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: sDate != null
          ? TimeOfDay(hour: sDate.hour, minute: sDate.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      sDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
    mDate.text = sDate.toString();
  }

  String getText() {
    if (sDate == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('MM/dd/yyyy').format(sDate);
    }
  }

  showDeleteDialogFunction(context, img, title, desc, place, createdAt, date) {
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
                        child: Image.network(img),
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
                                    'Are you sure you want to delete this event!',
                                type: AlertType.warning,
                                buttons: [

                                  DialogButton(
                                      child: Text('Delete'),
                                      onPressed: () {
                                        Event myEvent = Event(
                                            eventTitle: title,
                                            eventDescription: desc,
                                            eventPlace: place,
                                            date: date,
                                            imgUrl: img,
                                            createdAt: createdAt);
                                        dbContext
                                            .removeEvents(myEvent)
                                            .then((value) => {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ChangeNotifierProvider(
                                                                  create: (context) =>
                                                                      DbContext(),
                                                                  child:
                                                                      EventManagementConsolePage())))
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
}
