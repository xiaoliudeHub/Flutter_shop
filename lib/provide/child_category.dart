import 'package:flutter/material.dart';
import '../models/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; //二级高亮索引
  String categoryId = '4'; //一级分类id
  String subId = ''; //小类id
  int page = 1; //分页
  String norMoreText = ''; //显示没有数据的文字

  getChildCategory(List<BxMallSubDto> list, String id) {
    //一级分类切换
    page = 1;
    norMoreText = '';

    childIndex = 0;
    categoryId = id;

    //添加全部标签
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '00';
    all.comments = null;
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);

    notifyListeners();
  }

  //改变二级分类索引
  changeChildIndex(index, String id) {
    page = 1;
    norMoreText = '';

    childIndex = index;
    subId = id;
    notifyListeners();
  }

  //增加page的方法
  addPage(){
    page++;
  }

  changeNoMoreText(String text) {
     norMoreText = text;
     notifyListeners();
  }
}
