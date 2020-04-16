import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/shop_cart.dart';
import 'package:flutter_shop/provide/shop_cart.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  final CartInfoModel item;

  const CartCount({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(165),
        margin: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
        ),
        child: Provide<CartProvide>(
          builder: (context, child, value) {
            return Row(children: [_reduceBtn(context), _countArea(), _addBtn(context)]);
          },
        ));
  }

  //减号按钮
  Widget _reduceBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).addOrReduceAction(item, 'reduce');
      },
      child: Container(
        width: 45.w,
        height: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : Colors.grey,
          border: Border(
              right: BorderSide(
            width: 1.0,
            color: Colors.black12,
          )),
        ),
        child: item.count>1? Text('-') : Text(''),
      ),
    );
  }

  //加号按钮
  Widget _addBtn(context) {
    return InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).addOrReduceAction(item, 'add');
      },
      child: Container(
        width: 45.w,
        height: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(
            width: 1.0,
            color: Colors.black12,
          )),
        ),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea() {
    return Container(
      width: 70.w,
      height: 45.h,
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(item.count.toString()),
    );
  }
}
