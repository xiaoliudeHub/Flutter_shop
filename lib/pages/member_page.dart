import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: ListView(
        children: [
          _topHeader(),
          _orderTitle(),
          _orderType(),
          _actionList()
        ],
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 160.w,
            child: ClipOval(
              child: Image.network(
                  'http://blogimages.jspang.com/blogtouxiang1.jpg'),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '小六',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  //我的订单标题
  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 750.w,
      height: 150.h,
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(children: [
        Container(
          width: 187.w,
          child: Column(children: [
            Icon(
              Icons.payment,
              size: 30,
            ),
            Text('待付款'),
          ]),
        ),

        Container(
          width: 187.w,
          child: Column(children: [
            Icon(
              Icons.query_builder,
              size: 30,
            ),
            Text('待发货'),
          ]),
        ),
        Container(
          width: 187.w,
          child: Column(children: [
            Icon(
              Icons.directions_car,
              size: 30,
            ),
            Text('待收货'),
          ]),
        ),
        Container(
          width: 187.w,
          child: Column(children: [
            Icon(
              Icons.comment,
              size: 30,
            ),
            Text('待评价'),
          ]),
        )

      ]),
    );
  }


  //通用ListTile
  Widget _myListTile(String title){
    return Container(
       decoration: BoxDecoration(
         color:Colors.white,
         border:Border(bottom: BorderSide(width: 1.0, color:Colors.black12)),
       ),
       child: ListTile(
         leading: Icon(Icons.credit_card),
         title: Text(title),
         trailing: Icon(Icons.arrow_right),
       ),
    );
  }

  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top:10),
      child: Column(
        children:[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          _myListTile('客服电话'),
          _myListTile('关于我们'),
        ]
      ),
    );
  }
}
