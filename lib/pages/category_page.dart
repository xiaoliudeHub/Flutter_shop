import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/Category/category_goods_list.dart';
import 'package:flutter_shop/widgets/Category/left_category.dart';
import 'package:flutter_shop/widgets/Category/right_category.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../models/category.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: [
            LeftCategory(),
            Column(
              children: [
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            ),
          ],
          ),
        
      ),
    );
  }

  // void _getCategory() async {
  //   await request('getCategory').then((value) {
  //     var data = json.decode(value).toString();
  //     CategoryModel list = CategoryModel.fromJson(value);
  //     list.data.forEach((element) {
  //       print(element.mallCategoryName);
  //     });
  //   });
  // }
}


