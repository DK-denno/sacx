import "package:flutter/material.dart";

Material Profile(user,balance){
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
                backgroundImage: NetworkImage((() {
                  if(user!=null){
                    if(user['profile']['idPhoto']!=null){
                      return "${user['profile']['idPhoto']}";
                    }
                    return "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQEyza1-CKEJK6Hyq50yE8oOpyba5HbJaCqMioudHzaxVh-a9Is";
                  }
                  return "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQEyza1-CKEJK6Hyq50yE8oOpyba5HbJaCqMioudHzaxVh-a9Is";
                })()),
                radius: 50.0,
              ),
            ),
            Divider(height: 30.0),
            profDetails(user,balance),
          ],
        ),
    );
}

profDetails(user,balance){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person,
            color: Colors.black,
          ),
          Text((() {
            if(user!=null){
              return "${user['userdata']['username']}";
            }
            return "---";
          })())
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
          Text((() {
            if(user!=null){
              return "${user['userdata']['email']}";
            }
            return "---";
          })())
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
              Text((() {
                if(balance!=null){
                  return "${balance['totalAmount']}.00";
                }
                return "0.00";
              })())

            ],
          )
        ],
      ),
    ],
  );
}
