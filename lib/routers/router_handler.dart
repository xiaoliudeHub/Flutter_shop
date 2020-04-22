import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/login/login_page.dart';
import 'package:flutter_shop/pages/login/store_audit_page.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (context, parameters) {
    String goodsId = parameters['id'].first;
    return DetailsPage(
      goodId: goodsId,
    );
  },
);

Handler loginHandler = Handler(
  handlerFunc: (context, parameters) {
    return LoginPage();
  },
);

Handler storeHandler = Handler(
  handlerFunc: (context, parameters) {
    return StoreAuditPage();
  },
);
