import "package:flutter/material.dart";


class testList extends StatefulWidget {
  @override
  _testListState createState() => _testListState();
}

class _testListState extends State<testList> {

  List<String>reports=[
    "wdkshfgvbwdksjbvoiwsdkjgbvnuiwsjhvbuwfsjchkn jowfs",
    "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
    "ujdjwfvsbxjkndsjdscvugbsdmcnv yujhbdscxiujbdscyhjbfy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("TEST 123"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
      children: reports.map((report){
          return Text(report);
      }).toList()
    ),
    );
  }
}
