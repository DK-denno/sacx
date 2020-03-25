import "package:flutter/material.dart";

Material Profile(){
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
            profDetails(),
          ],
        ),
    );
}

profDetails(){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            color: Colors.black,
          ),
          Text(
            " emailHolder@gmail.com",
            style: TextStyle(

            ),
          )
        ],
      ),
      SizedBox(height: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.email,
            color: Colors.black,
          ),
          Text(
            " emailHolder@gmail.com",
            style: TextStyle(

            ),
          )
        ],
      ),
      SizedBox(height:30.0),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BALANCE",
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
            ],
          )
        ],
      ),
    ],
  );
}
