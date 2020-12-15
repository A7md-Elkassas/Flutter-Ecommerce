import 'package:flutter/material.dart';
import 'package:m_shop/screens/overviewscreen/overview.dart';
import 'package:provider/provider.dart';

import './constants.dart';
import './models/authentication.dart';
import './models/cart.dart';
import './models/products.dart';
import './routes.dart';
import './screens/Authenticate/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              brightness: Brightness.light,
              color: Colors.white,
              textTheme: TextTheme(
                headline6: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Muli',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              bodyText2: TextStyle(color: kTextColor),
            ),
          ),
          initialRoute:
              auth.isAuth ? OverView.route : AuthenticationScreen.route,
          routes: destinations,
        ),
      ),
    );
  }
}
