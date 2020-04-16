import 'package:flutter/material.dart';
import 'package:flutter_shop/models/shop_cart.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/provide/shop_cart.dart';
import 'package:flutter_shop/widgets/cart_page/cart_count.dart';
import 'package:provide/provide.dart';

class CartCell extends StatelessWidget {
  final CartInfoModel item;
  const CartCell({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 0.5,
            color: Colors.black26,
          ))),
      child: Row(
        children: [
          _cartCheckBtn(context, item),
          _cartImage(),
          _cartGoodsName(context, item),
          _cartPrice(context, item),
        ],
      ),
    );
  }

//选择按钮
  Widget _cartCheckBtn(context, item) {
    return Container(
      child: Checkbox(
        value: item.isCheck,
        onChanged: (bool val) {
          item.isCheck = val;
          Provide.value<CartProvide>(context).changeCheckState(item);
        },
        activeColor: Colors.pink,
      ),
    );
  }

  //商品图片
  Widget _cartImage() {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network(item.images),
    );
  }

  //商品名称
  Widget _cartGoodsName(context, item) {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.goodsName),
          SizedBox(height: 5.0),
          CartCount(item: item),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(context, item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(children: [
        Text('¥${item.price}'),
        Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('提示'),
                        content: Text('确认删除该商品？'),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Provide.value<CartProvide>(context)
                                  .deleteOneGoods(item.goodsId);
                                  Navigator.pop(context);
                            },
                            child: Text('确定'),
                          ),
                          FlatButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('取消')),
                        ],
                      );
                    });
              },
              child: Icon(
                Icons.delete,
                color: Colors.black26,
                size: 30,
              ),
            )),
      ]),
    );
  }
}
