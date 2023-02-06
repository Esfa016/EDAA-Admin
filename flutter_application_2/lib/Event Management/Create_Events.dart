

import 'dart:html';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/Event%20Management/EventManagementConsolePage.dart';
import '/Models/Events.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../app_colors.dart';



class CreateEvents extends StatefulWidget {
   DateTime sDate = DateTime.now();
  String imgPath="";
  TextEditingController place = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String myPath='https://firebasestorage.googleapis.com/v0/b/edda-53458.appspot.com/o/Custom%2Fplaceholder-image.png?alt=media&token=8e658992-8c0f-453e-967c-86901033911a';
  @override
  _CreateEventsState createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {

  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.orange,
        title: Center(child: Text(

            'Inform your members')),
      ),
      body: Container(

        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         Color(0xFF092E40),
          //         Color(0xFF092E40),
          //         Color(0xFF265168),
          //         Color(0xFFEF8242),
          //         Color(0xFFFFFFFF),
          //       ]),
          // ),
          // decoration: BoxDecoration(
          //     color: AppColor.white, borderRadius: BorderRadius.circular(20)),
         // padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(widget.myPath, width: 100, height: 100,),
              TextButton(onPressed: () async {
                // FilePickerResult? result = await FilePicker.platform.pickFiles();
                // if(result!=null)
                //   {
                //     File file = result.files.first as File;
                //     String fileName = result.files.first.name;
                //     // UploadTask task = FirebaseStorage.instance.ref('News Image/$fileName')
                //     // .putData(file!);
                //     FirebaseStorage.instance.ref('News Images/$fileName').putFile(file!);
                //
                //   }
                String mDate = DateTime.now().toString();

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
                    UploadTask mTask = FirebaseStorage.instance.ref().child(
                        'Events/$fileName').putBlob(file);
                    TaskSnapshot snapshot = await mTask;
                    snapshot.ref.getDownloadURL().then((value) =>
                        setState(() {
                          widget.myPath = value;
                        }));

                    print(widget.imgPath.toString());
                  });
                });
              }, child: Text(

                  'Upload Image',


                    style: TextStyle(

                      color: Color(0xFFEF8242),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
              )),
              SizedBox(height: 50,),
              Container(
                height: 100,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFEF8242),
                      ),
                    ),
                      labelText: 'Title of the event',
                    labelStyle: TextStyle(

                      color: Color(0xFFEF8242),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                    )),
                  controller: widget.title,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEF8242),
                        ),
                      ),
                      labelText: 'Description of the event',
                      labelStyle: TextStyle(

                        color: Color(0xFFEF8242),
                        fontSize: 22,
                        fontFamily: 'Poppins',
                      )),
                  controller: widget.description,
                ),
              ),



              Container(
                height: 100,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEF8242),
                        ),
                      ),
                      labelText: 'Place of the event',
                      labelStyle: TextStyle(

                        color: Color(0xFFEF8242),
                        fontSize: 22,
                        fontFamily: 'Poppins',
                      )

                  ),

                  controller: widget.place,
                ),
              ),

              SizedBox(height: 10,),

             Center(
               child: Container(
                 child: Row(children: [
                   SizedBox(width: 190,),
                 Container(
                   width: 250,
                   height: 50.0,
                   child: TextButton(
                  

                     onPressed: (){

                       pickDateTime(context);

                     },
                     child: Text(getText(),style: TextStyle(
                         fontSize: 15, fontFamily: 'Poppins')),
                
                   ),
                 ),




                   // TextButton(
                   //
                   //
                   //     onPressed: (){
                   //
                   //     pickDateTime(context);
                   //
                   // },
                   //     child: Text(
                   //
                   //         getText())),
                   SizedBox(width: 100,)
                   ,


                   Container(
                     width: 250,
                     height: 50.0,
                     child: ElevatedButton(
                      

                       onPressed: (){
                         if(widget.title.text.isEmpty || widget.place.text.isEmpty || widget.myPath.isEmpty || widget.sDate == null || widget.description.text.isEmpty)
                           {
                             Alert(context: context,
                             title: 'Error',
                             desc: 'Please fill all the fields',
                             type: AlertType.error).show();
                           }
                         else
                           {
                             Event myEvent = Event(eventTitle: widget.title.text
                                 .trim(),
                                 eventDescription: widget.description.text.trim(),
                                 eventPlace: widget.place.text.trim(),
                                 date: widget.sDate.toString(),
                                 imgUrl: widget.myPath,
                                  createdAt: Timestamp.now());
                             dbContext.addEvents(myEvent)
                                 .then((value) => {
                               Alert(context: context,
                                   type: AlertType.success,
                                   desc: 'Successful').show() .then((value) => {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                     create: (context)=>DbContext(),
                                     child: EventManagementConsolePage())))
                               })


                             })
                                 .catchError((onError)=>{
                               Alert(context: context,
                                   type: AlertType.error,
                                   content: Text(widget.sDate.toString()),
                                   desc: 'Error Formed  because $onError').show()
                             });

                           }

                       },
                       child: Text('Post Event',style: TextStyle(
                           fontSize: 15, fontFamily: 'Poppins')),
                      
                     ),
                   ),




                 ],),
               ),
             ),


            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: widget.sDate ?? initialDate,
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
      initialTime: widget.sDate != null
          ? TimeOfDay(hour: widget.sDate.hour, minute: widget.sDate.minute)
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
      widget.sDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
  String getText() {
    if (widget.sDate == null) {
      return 'Select DateTime';
    } else {
      return DateFormat('MM/dd/yyyy HH:mm').format(widget.sDate);
    }
  }

}