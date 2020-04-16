import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/shop_cart.dart';
import 'package:flutter_shop/widgets/cart_page/shop_cart_bottom.dart';
import 'package:flutter_shop/widgets/cart_page/shop_cart_cell.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (contex, snapshot) {
          List cartList = Provide.value<CartProvide>(context).cartList;
          if (snapshot.hasData) {
            return Stack(children: [
              Provide<CartProvide>(
                builder: (context, child, value) {
                  cartList = Provide.value<CartProvide>(context).cartList;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return CartCell(item: cartList[index]);
                    },
                    itemCount: cartList.length,
                  );
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: CartBottom(),
              )
            ]);
          } else {
            return Text('正在加载');
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
