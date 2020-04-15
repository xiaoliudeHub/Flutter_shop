import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  final String goodId;
  const DetailsPage({Key key, this.goodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('商品ID:${goodId}'),
      ),
    );
  }
}