import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Events.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'EventManagementConsolePage.dart';

class UpdateEvent extends StatefulWidget {
  String img;
  String place;
  String title;
  String description;
  String date;

  @override
  _UpdateEventState createState() => _UpdateEventState();

  UpdateEvent({
    required this.img,
    required this.place,
    required this.title,
    required this.description,
    required this.date,
  });
}

class _UpdateEventState extends State<UpdateEvent> {
  DateTime sDate = DateTime.now();
  TextEditingController dateController = TextEditingController();






  @override
  Widget build(BuildContext context) {


    final dbContext = Provider.of<DbContext>(context);

    final saverTitle = widget.title;
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    TextEditingController placeController = TextEditingController();


    dateController.text = sDate.toString();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15),
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
                  snapshot.ref.getDownloadURL().then((value) => setState(() {
                        widget.img = value;
                      }));

                  // print(img.toString());
                });
              });
            },
            child: Container(
              width: 100,
              height: 100,
              child: Image.network(widget.img),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(labelText: widget.title),
              controller: titleController,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(labelText: widget.description),
              controller: descController,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(labelText: widget.place),
              controller: placeController,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(labelText: 'Selected Date'),
              controller: dateController,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 250,
            height: 50.0,
            child: RaisedButton(
              color: Color(0xFFEF8242),
              textColor: Colors.white,
              onPressed: () {

                setState(() {
                  pickDateTime(context);
                });

              },
              child: Text('Select Date',
                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xFFEF8242))),
            ),
          ),
          Center(
              child: Container(
            color: Colors.red,
            child: ElevatedButton(
                onPressed: () {

                  Event myEvent = Event(
                      imgUrl: widget.img,
                      createdAt: Timestamp.now(),
                      date: dateController.text,
                      eventDescription: descController.text.trim().isEmpty? widget.description: descController.text.trim(),
                      eventPlace: placeController.text.trim().isEmpty? widget.place:placeController.text.trim(),
                      eventTitle: titleController.text.trim().isEmpty? widget.title:titleController.text.trim()
                  );
                  dbContext.updateEvents(myEvent, saverTitle).then((value) => {
                    Alert(
                        context: context,
                        type: AlertType.success,
                        desc: 'Successfully updated event',
                        buttons: [
                          DialogButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                              create: (context) =>
                                                  DbContext(),
                                              child:
                                              EventManagementConsolePage())));
                            },
                          )
                        ]).show()
                  });



                },
                child: Text('Edit Event')),
          )),
        ],
      ),
    );
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


  }

  String getText() {
    if (sDate == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('MM/dd/yyyy HH:mm').format(sDate);
    }
  }
}
