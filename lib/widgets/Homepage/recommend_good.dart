
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';

class Recommend extends StatelessWidget {
  final List recommendList;

  const Recommend({Key key, this.recommendList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(385),
      margin: EdgeInsets.only(top:10.0),
      child: Column(
        children:[
          _titleWidget(),
          _recommentList(),
        ],
      ),
    );
  }

//头部标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink,
        ),
      ),
    );
  }

//商品
  Widget _item(context,index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context,"/detail?id=${recommendList[index]['goodsId']}");
      },
      child: Container(
        height: ScreenUtil().setHeight(270),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 0.5, color: Colors.black12)),
        ),
        child: Column(
          children: [
            Image.network(recommendList[index]['image']),
            SizedBox(height:5.0),
            Text('¥${recommendList[index]['mallPrice']}'),
            Text(
              '¥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //横向列表
  Widget _recommentList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        itemBuilder: (context, index){
          return _item(context, index);
        },
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
      ),
    );
  }
}
