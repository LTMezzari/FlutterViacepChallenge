import 'package:flutter/cupertino.dart';

T? routeArguments<T>(BuildContext context) {
  return ModalRoute.of(context)?.settings.arguments as T?;
}