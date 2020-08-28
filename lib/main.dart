import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_weather_mobile/core/providers/providers.dart';
import 'package:open_weather_mobile/core/providers/states.dart';
import 'package:open_weather_mobile/core/routes/constants.dart';
import 'package:open_weather_mobile/core/routes/routes.dart';
import 'package:open_weather_mobile/view/styles/color.dart';
import 'package:provider/provider.dart';

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
    _forTransparantStatusBar();
    _toHome();
  }

  _forTransparantStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StatesProvider()),
        ChangeNotifierProvider(create: (_) => AppProviders()),
      ],
      child: MaterialApp(
        title: 'Open Weather',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            elevation: 0,
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            color: Colors.white,
            brightness: Brightness.light,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
