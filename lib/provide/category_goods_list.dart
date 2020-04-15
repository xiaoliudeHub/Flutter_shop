import 'package:flutter/material.dart';
import '../models/category_good.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  
  List<CategoryGood> goodsList = [];
  
  
  //点击大类更换商品列表
  getGoodsList(List<CategoryGood> list){
    goodsList = list ;
    notifyListeners();
  }

  //点击大类更换商品列表
  getMoreGoodsList(List<CategoryGood> list){
    goodsList.addAll(list) ;
    notifyListeners();
  }
  
}