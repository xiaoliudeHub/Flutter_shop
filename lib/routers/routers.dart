import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routers {
  static String root = '/';
  static String detailsPage= '/detail';
  static String loginPage = '/login';
  static String storePage = '/store';

  static void configureRouters(Router router) {
    router.notFoundHandler = Handler(
       handlerFunc: (context, parameters) {
         print('ERROR===> ROUTER NOT FOUND!!!'); 
       },
    );

    router.define(detailsPage, handler: detailsHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(storePage, handler: storeHandler);
  }
}

