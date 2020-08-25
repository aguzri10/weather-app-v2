import 'package:flutter/material.dart';
import 'package:open_weather_mobile/core/routes/constants.dart';
import 'package:open_weather_mobile/core/routes/routes.dart';
import 'package:open_weather_mobile/view/styles/color.dart';

void main() {
  runApp(MyApp());
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    _toHome();
  }

  _toHome() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamedAndRemoveUntil(context, homeRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Weather',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
