// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/common/my_scroll_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_action.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreAuditPage extends StatefulWidget {
  @override
  _StoreAuditPageState createState() => _StoreAuditPageState();
}

class _StoreAuditPageState extends State<StoreAuditPage> {
  // File _imageFile;
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();

  String _address = '陕西省 西安市 雁塔区 高新六路201号';

  // void _getImage() async {
  //   try {
  //     _imageFile = (await ImagePicker.pickImage(
  //         source: ImageSource.gallery,
  //         maxWidth: 800,
  //         imageQuality: 95)) as File;
  //     setState(() {});
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "没有权限，无法打开相册！");
  //   }
  // }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.white,
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText1,
          displayDoneButton: false,
        ),
        KeyboardAction(
          focusNode: _nodeText2,
          displayDoneButton: false,
        ),
        KeyboardAction(
          focusNode: _nodeText3,
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: const Text('关闭'),
                ),
              );
            },
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '店铺审核资料',
        ),
      ),
      body: MyScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        keyboardConfig: _buildConfig(context),
        tapOutsideToDismiss: true,
        children: null,
        bottomButton: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: FlatButton(
              onPressed: () {},
              child: Container(
                height: 80.h,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('提交',
                    style: TextStyle(
                      fontSize: 36.sp,
                    )),
              )),
        ),
      ),
    );
  }
}
