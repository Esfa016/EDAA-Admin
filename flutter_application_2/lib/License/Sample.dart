import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
class Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  
 @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Selam this is a try.')),
        body: SafeArea(
          child: Container(
            width:  MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                   child: Column(
                children: [
                  RaisedButton(onPressed: (){dbContext.populate();}),
                  Container(
                    width: 100,
                    height: 320,
                    child: ListView.builder(
                        itemCount: dbContext.licenseList.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            title: Text(dbContext.licenseList[index].email.toString()),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


