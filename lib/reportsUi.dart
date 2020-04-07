import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttersacco/main.dart';




class reports extends StatefulWidget {
  @override
  _reportsState createState() => _reportsState();
}

class _reportsState extends State<reports> {


    List<String>reports=[
      "wdkshfgvbwdksjbvoiwsdkjgbvnuiwsjhvbuwfsjchkn jowfs",
      "wdkshfgvbwdksjbvoiwsdkjgbvnuiwsjhvbuwfsjchkn jowfs",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
      "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",

    ];


  @override
  Widget build(BuildContext context) {
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
                        subtitle: Text(report),
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
