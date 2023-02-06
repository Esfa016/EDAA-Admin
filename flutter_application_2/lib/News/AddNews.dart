//import 'dart:io';
import 'dart:html';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/News.dart';
import 'package:flutter_application_2/News/NewsConsolePage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'dart:html';

import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../app_colors.dart';
class AddNews extends StatefulWidget {
 String imgPath="";
 TextEditingController title = TextEditingController();
 TextEditingController description = TextEditingController();
  @override
  _AddNewsState createState() => _AddNewsState();
  String myPath='https://firebasestorage.googleapis.com/v0/b/edda-53458.appspot.com/o/Custom%2Fplaceholder-image.png?alt=media&token=8e658992-8c0f-453e-967c-86901033911a';
}

class _AddNewsState extends State<AddNews> {

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
        child: Column(
          children: [

            Image.network(widget.myPath,width: 100, height: 100,),
            TextButton(onPressed: ()async{
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

              FileUploadInputElement input = FileUploadInputElement()..accept="image/*";
              input.click();
              input.onChange.listen((event) {

                final file = input.files?.first;
                String fileName = file!.name;
                final reader = FileReader();
                reader.readAsDataUrl(file!);
                reader.onLoadEnd.listen((event)async {
                  // FirebaseStorage.instance.ref().child('News/$mDate')
                  //     .putBlob(file).then((p0) => print('success'))
                  //     .catchError((onError)=>print('$onError'));
                  //TaskSnapshot snapshot = await dbContext.uploadNewsImage(file);
                // widget.imgPath = dbContext.uploadNewsImage(file);
                  UploadTask mTask = FirebaseStorage.instance.ref().child('News/$fileName') .putBlob(file);
                  TaskSnapshot snapshot = await mTask;
                   snapshot.ref.getDownloadURL().then((value) =>  setState(() {
                       widget.myPath = value;
                   }));

                 print(widget.imgPath.toString());
                });

              });

            }, child: Text('Upload Image',

                style: TextStyle(
                  color: Color(0xFFEF8242),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              )
            ),
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

                  labelStyle: TextStyle(

                    color: Color(0xFFEF8242),
                    fontSize: 22,
                    fontFamily: 'Poppins',
                  ),

                labelText: 'Enter Title',



              ),
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

                  labelStyle: TextStyle(
                    color: Color(0xFFEF8242),
                    fontSize: 22,
                    fontFamily: 'Poppins',
                  ),


                labelText: 'Enter Description'
              ),
                controller: widget.description,
              ),
            ),
            SizedBox(height: 10,),



            Center(
              child: RaisedButton(
                color: Color(0xFFEF8242),
                textColor: Colors.white,

                onPressed: (){
                  if(widget.title.text.isEmpty ||  widget.myPath.isEmpty || widget.description.text.isEmpty)
                  {
                    Alert(context: context,
                        title: 'Error',
                        desc: 'Please fill all the fields',
                        type: AlertType.error).show();
                  }
                  else
                  {
                    News myNews = News(imgUrl: widget.myPath, newsTitle: widget.title.text.trim(), newsDescription: widget.description.text.trim(),createdAt: Timestamp.now());
                    dbContext.addNews(myNews)
                        .then((value) => {
                      Alert(context: context,
                          type: AlertType.success,
                          desc: 'Successful').show()
                      .then((value) => {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                            create: (context)=>DbContext(),
                            child: NewsConsolePage())))
                      })
                    })
                        .catchError((onError)=>{
                      Alert(context: context,
                          type: AlertType.error,
                          desc: 'Error Formed because $onError').show()
                    });

                  }

                },
                child: Text('Post News',style: TextStyle(
                    fontSize: 15, fontFamily: 'Poppins')),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFFEF8242))),
              ),
            ),



          ],
        ),
      ),
    );
  }
  void uploadImage()
  {
   // FileUploadInputElement uploadInput = FileUploadInputElement()..accept ='image/*';
   // uploadInput.click();
   // uploadInput.onChange.listen((event) {
   //   final file = uploadInput.files?.first;
   //   final reader = FileReader();
   //   reader.readAsDataUrl(file!);
   //   reader.onLoadEnd.listen((event) {
   //
   //     print('done');

   //   });
   // });
  }
}
