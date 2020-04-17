import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/Category/category_goods_list.dart';
import 'package:flutter_shop/widgets/Category/left_category.dart';
import 'package:flutter_shop/widgets/Category/right_category.dart';



class CategoryPage extends StatelessWidget {
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
}



