import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (20 / 375) * MediaQuery.of(context).size.width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Special For You'),
              FlatButton(
                child: Text('see more'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              specialCards(
                context: context,
                title: 'SmartPhones',
                brandsNum: 18,
                image: 'assets/images/Image Banner 2.png',
                press: () {},
              ),
              specialCards(
                context: context,
                title: 'Fashion',
                image: 'assets/images/Image Banner 3.png',
                brandsNum: 10,
                press: () {},
              ),
              SizedBox(
                width: (20 / 375) * MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget specialCards(
    {BuildContext context,
    String image,
    String title,
    int brandsNum,
    GestureTapCallback press}) {
  return Padding(
    padding:
        EdgeInsets.only(left: (20 / 375) * MediaQuery.of(context).size.width),
    child: GestureDetector(
      onTap: press,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: (242 / 375) * MediaQuery.of(context).size.width,
          height: (100 / 375) * MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFF343434).withOpacity(0.4),
                      Color(0XFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (15 / 375) * MediaQuery.of(context).size.width),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '$brandsNum brands',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
