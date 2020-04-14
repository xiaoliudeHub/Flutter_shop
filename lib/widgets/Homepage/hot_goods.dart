import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {

  @override
  void initState() {
    request('homePageBelowContent', formData:1).then((value) {
         print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('11111'),
    );
  }
}