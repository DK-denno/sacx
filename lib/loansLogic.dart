import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttersacco/formControllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoansLogic {

  static Future<String> borrowLoan(int ammount, String guaranter1,String guaranter2,String guaranter3,) async {
    var jsonData = null;
    var response = await http.post("https://devsacco.herokuapp.com/api/updateLoan/",
    body: {
      "user":3,
      "totalAmount":ammount,
      "guaranter1":guaranter1,
      "guaranter2":guaranter3,
      "guaranter3":guaranter3,
      "transactionType":"borrow"
    });
    print(response);

  }
  static Future<String> signup(String username,String email,String password,String first_name,String last_name) async {
    print(email);
    var jsonData = null;
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    var response = await http.post("https://devsacco.herokuapp.com/api/addUser/",
        body: {
          "username": username,
          "password": password,
          "email":email,
          "first_name":first_name,
          "last_name":last_name});
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    jsonData = json.decode(response.body);
    print(jsonData['username'][0]);
    print("\n\n\n\n\n\n\n\n\n");
    try {
      if (jsonData['username'] == username &&
          jsonData['first_name'] == first_name) {
        jsonData = json.decode(response.body);
        print(response.body + "\n dk");
        sharedpreferences.setString("username", jsonData['username']);
        sharedpreferences.setString("password", jsonData['password']);
        print("done");
        return "success";
      } else {
        print(jsonData);
        return jsonData['username'][0];
      }
    }catch(error){
      print("error");
      print(error);
      return jsonData['username'][0];
    }
  }
}