import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: 80.h,
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                  width: 110.w,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red,
                  ))),
          InkWell(
            onTap: () {},
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
            onTap: () {},
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
