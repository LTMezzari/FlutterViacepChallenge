import 'package:challenge/feature/viacep/ui/search/search_address_page.dart';
import 'package:challenge/feature/viacep/ui/detail/search_address_detail_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> viacepRoutes() => {
  SearchAddressPage.route: (context) => SearchAddressPage(),
  SearchAddressDetailPage.route: (context) => SearchAddressDetailPage(),
};