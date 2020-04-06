import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttersacco/formControllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class depositLogic {

  static Future deposit(int amount,int user) async {
    var jsonData = null;
    var response = await http.post("https://devsacco.herokuapp.com/api/updateDeposit/",
        body: {
          "user":"${user}",
          "transactionType":"paid",
          "description":"deposit",
          "totalAmount":"${amount}"
    });
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    jsonData = json.decode(response.body);
    print(jsonData);
    print("\n\n\n\n\n\n\n\n\n");
    return jsonData;
//    try{
//      if (jsonData['user']['username']==username) {
//        jsonData = json.decode(response.body);
////          print(response.body);
////          print("works");
//        sharedpreferences.setString("username", jsonData['username']);
//        sharedpreferences.setString("password", jsonData['password']);
//        return jsonData;
//      } else {
//        return "failed";
//      }
//    }catch(error){
//      return "failed";
//    }
  }

}