import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttersacco/formControllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthLogic {

  static Future signin(String username, String Password) async {
    var jsonData = null;
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    var response = await http.post("https://devsacco.herokuapp.com/api/login/",
        body: {"username": username, "password": Password});
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    jsonData = json.decode(response.body);
    print(jsonData);
    print("\n\n\n\n\n\n\n\n\n");
    try{
      if (jsonData['user']['username']==username) {
          jsonData = json.decode(response.body);
//          print(response.body);
//          print("works");
          sharedpreferences.setString("username", jsonData['username']);
          sharedpreferences.setString("password", jsonData['password']);
          return jsonData;
      } else {
        return "failed";
      }
    }catch(error){
      return "failed";
    }
   }
  static Future signup(String username,String email,String password,String first_name,String last_name) async {
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
    print(jsonData);
    print("\n\n\n\n\n\n\n\n\n");
    return jsonData;
  }
}