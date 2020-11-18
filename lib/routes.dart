import 'package:flutter/material.dart';

import './screens/Authenticate/authenticate.dart';
import './screens/cartScreen/cart_screen.dart';
import './screens/overviewscreen/overview.dart';
import './screens/productdetails/product_details.dart';
import 'screens/forgotPassword/forgot_password_screen.dart';

final Map<String, WidgetBuilder> destinations = {
  OverView.route: (context) => OverView(),
  ProductDetails.route: (context) => ProductDetails(),
  CartScreen.route: (context) => CartScreen(),
  AuthenticationScreen.route: (context) => AuthenticationScreen(),
  ForgotPasswordScreen.route: (context) => ForgotPasswordScreen(),
};
