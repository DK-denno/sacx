import "package:flutter/material.dart";

class LoansPage extends StatefulWidget {
  @override
  _LoansPageState createState() => _LoansPageState();
}

Material loansPage(){
  return Material(
    color: Colors.white,
    elevation: 40.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/login.jpeg"),
            radius: 50.0,
          ),
        ),
        Divider(height: 30.0),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
                "LOAN LIMIT",
                style: TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet,
                    size: 30.0,
                  ),
            Text(
                  "9000.00",
                  style: TextStyle(
                  fontSize: 30.0
                     ),
                  )
                 ] ,
                )
              ],
            ),
           ],
          ),
      );
}

class _LoansPageState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan"),
      ),
      body: Container(
        child: loansPage(),
      ),
    );
  }
}
