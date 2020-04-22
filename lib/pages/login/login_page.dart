import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/login_provide.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/widgets/common/colors.dart';
import 'package:flutter_shop/widgets/common/gaps.dart';
import 'package:flutter_shop/widgets/common/my_scroll_view.dart';
import 'package:flutter_shop/widgets/common/text_filed.dart';
import 'package:provide/provide.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //焦点
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  void initState() {
    super.initState();

    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    // _nameController.text
  }

  void _verify() {
    String name = _nameController.text;
    String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }

    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    Provide.value<LoginProvide>(context).LoginAction(_nameController.text, _passwordController.text);
    Application.router.navigateTo(context, '/store');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text('验证码登录',
                  style: TextStyle(fontSize: 30.sp, color: Colors.black)))
        ],
      ),
      body: MyScrollView(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
          children: _buildBody),
    );
  }

  get _buildBody => [
        Text(
          '密码登录',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(52.0), fontWeight: FontWeight.bold),
        ),
        Gaps.vGap16,
        MyTextField(
          key: const Key('phone'),
          controller: _nameController,
          focusNode: _nodeText1,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: '请输入账号',
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('password'),
          controller: _passwordController,
          focusNode: _nodeText2,
          isInputPwd: true,
          keyboardType: TextInputType.visiblePassword,
          maxLength: 16,
          hintText: '请输入密码',
        ),
        SizedBox(height:35),
        FlatButton(
          textColor: Colors.white,
          color: Colours.app_main,
          disabledColor: Colours.button_disabled,
          disabledTextColor: Colours.text_disabled,
          onPressed: _clickable ? _login : null,
          child: Container(
            height: 80.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              '登录',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ];
}
