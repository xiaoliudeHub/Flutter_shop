import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/provide/shop_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: 80.h,
      child: Row(
        children: [
          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: 110.w,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.shopping_cart,
                        size: 35,
                        color: Colors.red,
                      ))),
              Provide<CartProvide>(
                builder: (context, child, value) {
                  int goodsCount =
                      Provide.value<CartProvide>(context).allGoodsCount;
                      return Positioned(
                        top: 0,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0),

                          ),
                          child: Text(
                            '${goodsCount}',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 22.sp,
                            )
                          ),
                        ),
                        );
                },
              )
            ],
          ),
          InkWell(
            onTap: () async {
              await Provide.value<CartProvide>(context)
                  .save(goodsId, goodsName, count, price, images);
              Fluttertoast.showToast(
                  msg: '添加购物车成功', gravity: ToastGravity.CENTER);
            },
            child: Container(
                alignment: Alignment.center,
                width: 320.w,
                height: 80.h,
                color: Colors.green,
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                  ),
                )),
          ),
          InkWell(
            onTap: () async {
              await Provide.value<CartProvide>(context).remove();
              Fluttertoast.showToast(
                  msg: '购物车清空成功', gravity: ToastGravity.CENTER);
            },
            child: Container(
                alignment: Alignment.center,
                width: 320.w,
                height: 80.h,
                color: Colors.red,
                child: Text(
                  '立即购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
