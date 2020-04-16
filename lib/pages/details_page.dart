import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/widgets/goodsDetail/detail_top_area.dart';
import 'package:flutter_shop/widgets/goodsDetail/details_bottom.dart';
import 'package:flutter_shop/widgets/goodsDetail/details_explain.dart';
import 'package:flutter_shop/widgets/goodsDetail/details_tabbar.dart';
import 'package:flutter_shop/widgets/goodsDetail/details_web.dart';
import 'package:provide/provide.dart';

class DetailsPage extends StatelessWidget {
  final String goodId;
  const DetailsPage({Key key, this.goodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  child: ListView(children: [
                    DetailTopArea(),
                    DetailExplain(),
                    DetailsTabbar(),
                    DetailsWeb(),
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailBottom(),
                ),
              ],
            );
          } else {
            return Text('加载中');
          }
        },
        future: _getBackInfo(context),
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodId);
    return '完成加载';
  }
}
