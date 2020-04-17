import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/category_good.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(builder: (context, child, data) {
      try {
        if (Provide.value<ChildCategory>(context).page == 1) {
          //列表回到顶部
          scrollController.jumpTo(0.0);
        }
      } catch (e) {
        print('进入界面第一次初始化${e}');
      }
      if (data.goodsList.length == 0) {
        return Center(
          child: Text('暂无数据'),
        );
      } else {
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(570),
            color: Colors.white,
            child: EasyRefresh(
              footer: ClassicalFooter(
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  noMoreText: Provide.value<ChildCategory>(context).norMoreText,
                  loadText: '上拉加载',
                  loadingText: '加载中...'),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _categoryListCell(data.goodsList[index]);
                },
                itemCount: data.goodsList.length,
                shrinkWrap: true, //使用子控件的总长度来设置ListView的长度（这里的长度为高度）
                controller: scrollController,
              ),
              onRefresh: () async {
                _getMoreList(false);
              },
              onLoad: () async {
                _getMoreList(true);
              },
            ),
          ),
        );
      }
    });
  }

  //获取商品列表
  void _getMoreList(bool isLoadMore) async {
    if (isLoadMore) {
      Provide.value<ChildCategory>(context).addPage();
    }
    
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': isLoadMore ? Provide.value<ChildCategory>(context).page : 1,
    };

    await request('getMallGoods', formData: data).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.data == null) {
        Fluttertoast.showToast(
          msg: '已经加载全部了',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 26.sp,
        );
        Provide.value<ChildCategory>(context).changeNoMoreText('没有更多了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getMoreGoodsList(goodsList.data);
      }
    });
  }

  Widget _categoryListCell(CategoryGood item) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${item.goodsId}');
      },
      child: Container(
        height: ScreenUtil().setHeight(190),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: Row(
          children: [
            Image.network(
              item.image,
              width: ScreenUtil().setWidth(110),
              // height: ScreenUtil().setHeight(150),
            ),
            _goodInfo(item),
          ],
        ),
      ),
    );
  }

  Widget _goodInfo(CategoryGood item) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (750 - 180 - 110 - 40).w,
            child: Text(
              item.goodsName,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _goodPrice(item),
        ],
      ),
    );
  }

  Widget _goodPrice(CategoryGood item) {
    return Container(
        width: (750 - 180 - 110 - 40).w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '价格：¥${item.presentPrice}',
              style: TextStyle(color: Colors.pink),
            ),
            SizedBox(width: 5.0),
            Text(
              '¥${item.oriPrice}',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                fontSize: ScreenUtil().setSp(18),
              ),
            ),
          ],
        ));
  }
}
