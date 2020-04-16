
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/good_details.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {

  DetailsGood goodsInfo = null;
  
  bool isLeft = true;
  bool isRight = false;

  //tabbar的切换方法
  changeLeftAndRight(String changeState){
      if (changeState == 'left') {
        isLeft = true;
        isRight = false;
      } else {
        isLeft = false;
        isRight = true;
      }
      notifyListeners();
  }

  //从后台获取数据
  getGoodsInfo(String id) async{
      var formData = {'goodId':id};
     await request('getGoodDetailById', formData:formData).then((value) {
          var responsData = json.decode(value.toString());
          print(responsData);
          goodsInfo = DetailsGood.fromJson(responsData);
          notifyListeners();
      });
  }
   
  
}