import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class DisableLicense extends StatefulWidget {
  String FullName;
  String Occupation;
  String LicenseId;
  String Email;
  String Phone;
  String  IssueDate;
  String ExpiryDate;
  String imgUrl;
  String uid;
  String Address;
  String Woreda;
  String HouseNumber;

  String status;




  @override
  _DisableLicenseState createState() => _DisableLicenseState();


  DisableLicense({
    required this.FullName,
    required this.Occupation,
    required this.LicenseId,
    required this.Email,
    required this.Phone,
    required this.IssueDate,
    required this.ExpiryDate,
    required this.imgUrl,
    required this.uid,
    required this.Address,
    required this.Woreda,
    required this.HouseNumber,
    required this.status,
  });
}

class _DisableLicenseState extends State<DisableLicense> {

  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    String text="Disable";


    return Scaffold(

      appBar: AppBar
        (
        title: Text('Manage License'),
      ),
      body: SafeArea(

        child: Center(
          child: Container(
            child: Column(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.imgUrl),),
                SizedBox(height: 5,),
                Text(widget.FullName),
                SizedBox(height: 5,),
                Text(widget.LicenseId),
                SizedBox(height: 5,),
                Text(widget.Occupation),
                SizedBox(height: 5,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if(text == 'Enabled')
                      {
                        text ='Disable';
                      }
                    else
                      {
                        text ='Enable';
                      }
                  });

                     dbContext.enableDisableLicense(widget.uid)
                     .then((value) => {
                       Alert(context: context,type: AlertType.success,desc: 'Successful!').show()
                     }).catchError((onError)
                     {
                       Alert(context: context,type: AlertType.success,desc: 'Error caused!').show();
                     });
                     setState(() {
                       if(widget.status == 'Enabled')
                         {
                           text = 'Disable';
                         }
                       else
                         {
                           text = 'Enable';
                         }
                     });
                   }


                , child: Container(

                      child: Text(text)
                  ),
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
