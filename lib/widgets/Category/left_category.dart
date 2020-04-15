import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/category_good.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';



class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {

  List list = [];
  List dataList = [];
  var listIndex = 0;

 @override
  void initState() {
    _getCategory();
    _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border:Border(right: BorderSide(
           width: 1,
           color: Colors.black12,
        )),
      ),
       child: ListView.builder(
          itemBuilder: (context, index){
            return _leftInkWell(index);
          },
          itemCount: list.length,
       ),
    );
  }

  Widget _leftInkWell(int index){
    bool isClick = false;
    isClick=(index==listIndex)?true:false;
    return InkWell(
       onTap: (){
         setState(() {
           listIndex = index;
         });
         var childList = list[index].bxMallSubDto;
         var categoryId = list[index].mallCategoryId;
         Provide.value<ChildCategory>(context).getChildCategory(childList, categoryId);
         _getGoodsList(categoryId: categoryId);
       },
       child: Container(
         height: ScreenUtil().setHeight(100),
         padding: EdgeInsets.only(left:10.0, top: 20.0),
         decoration: BoxDecoration(
           color: isClick?Color.fromRGBO(236, 236, 236, 1.0):Colors.white,
           border:Border(bottom: BorderSide(
             width: 0.5,
             color: Colors.black12,
           )),
         ),
         child: Text(
            list[index].mallCategoryName,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
            ),
         ),
       ),
    );
  }

//获取分类
  void _getCategory() async {
    await request('getCategory').then((value) {
      var data = json.decode(value.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategory>(context).getChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }

//获取商品列表
  void _getGoodsList({String categoryId}) async {
    var data = {'categoryId': categoryId==null?'4':categoryId, 'categorySubId': '', 'page': 1};

    await request('getMallGoods', formData: data).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
    });
  }
}