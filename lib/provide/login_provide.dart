import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvide with ChangeNotifier {
  
  String phoneNum;
  String passWord;

  LoginAction(String phoneNum, String passWord) async {
    phoneNum = phoneNum;
    passWord = passWord;
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNum', phoneNum);
    prefs.setString('passWord', passWord);
    notifyListeners();
  }



}