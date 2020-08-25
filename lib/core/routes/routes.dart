import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/routes/constants.dart';
import 'package:open_weather_mobile/view/home.dart';

import '../../main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => Root());
      // break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return null;
    }
  }
}
