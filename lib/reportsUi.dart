import 'dart:collection';
import 'dart:convert';
import "loader.dart";
import "package:flutter/material.dart";
import 'package:after_layout/after_layout.dart';
import "package:http/http.dart" as http;




class reports extends StatefulWidget {
  var logData;
  reports({Key key, this.logData}) : super(key: key);

  @override
  _reportsState createState() => _reportsState();
}

class _reportsState extends State<reports>{
  List<dynamic> reports;
  bool _isloading=true;
  final GlobalKey<State> keyLoader = new GlobalKey<State>();

  @override
  void initState(){
    super.initState();
    getData();
  }
  getData() async{
    var jsonData=null;
    var response = await http.post("https://devsacco.herokuapp.com/api/getuserTransactionReport/",
        body:{
          "id":"${widget.logData['profile']['user']}"
//          "id":5
        });
    jsonData=json.decode(response.body);
    print(jsonData);
    setState(() {
      reports=jsonData;
      _isloading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_isloading==true){
       return Scaffold(
         appBar: AppBar(
           title:Text("Transaction reports"),
           backgroundColor: Colors.white,
         ),
         body: Center(
           child: new CircularProgressIndicator(),
           ),
       );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Transaction reports"),
          backgroundColor: Colors.blue,
        ),
        body:ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("   "),
                    Text("Name: Placeholder username",style: TextStyle(fontSize: 20.0),),
                  ],
                ),

              ],
            ),
            Divider(height: 20.0,color: Colors.white),
            Column(
              children: reports.map((report) {
                return Container(
                  height: 100,
                  child: Card(
                    elevation: 15.0,
                    borderOnForeground: true,
                    shadowColor: Color(0x802196F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.arrow_right, size: 30),
                          title: Text('Outward:Loan'),
                          subtitle: Text("rada"),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),

      );
    }

  }
}
