
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
        builder: (context, child, data) {
          var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
           if (goodsInfo != null) {
              return Container(
                 color: Colors.white,
                 child: Column(
                   children:[
                     _goodsImage(goodsInfo.image1),
                     _goodName(goodsInfo.goodsName),
                     _goodsNum(goodsInfo.goodsSerialNumber),
                     _goodPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
                   ]
                 ),
              );
           }else {
             return Text('正在加载中...');
           }
        },
    );
  }

  //商品图片
  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  //商品图片
  Widget _goodName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  //商品编号
  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号：${num}',
        style: TextStyle(color: Colors.black26),
      ),
    );
  }

  //商品价格
  Widget _goodPrice(price, oldPrice){
    return Container(
        width: ScreenUtil().setWidth(740),
        padding: EdgeInsets.only(left:15.0),
        margin: EdgeInsets.only(top:8.0, bottom:10.0),
        child: Row(
          children:[
            Text(
              '¥${price.toString()}',
              style:TextStyle(
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(25),
              ),
            ),
            SizedBox(width:10.0),
            Text(
              '市场价',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.black38,
              ),
            ),
            Text(
              '¥${oldPrice.toString()}',
              style: TextStyle(
                color:Colors.grey,
                fontSize: ScreenUtil().setSp(25),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ]
        ),
    );
  }

}
