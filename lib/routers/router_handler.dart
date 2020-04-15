import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (context, parameters) {
    String goodsId = parameters['id'].first;
    return DetailsPage(goodId: goodsId,);
  },
);