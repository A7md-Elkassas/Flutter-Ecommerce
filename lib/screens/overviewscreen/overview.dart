import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/overview/categories.dart';
import '../../widgets/overview/offer_section.dart';
import '../../widgets/overview/overview_header.dart';
import '../../widgets/overview/popular_products.dart';
import '../../widgets/overview/special_products.dart';

class OverView extends StatefulWidget {
  static String route = '/overview_screen';

  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OverviewHeader(),
              OfferSection(),
              Categories(),
              SpecialProducts(),
              PopularProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
