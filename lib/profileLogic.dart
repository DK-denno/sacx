import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersacco/formControllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProfileLogic {

  static Future<String> getProfile(int user) async {
//   var jsonData=null;
    var response = await http.post("https://devsacco.herokuapp.com/api/getUserProfileById/",
    body:{
      "user":user
    });
    if(response!=null){
      print(response);
    }else{
      print("erroe");
    }
   }
}