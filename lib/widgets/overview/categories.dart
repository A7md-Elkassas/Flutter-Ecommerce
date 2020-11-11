import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoreis = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all((20 / 375) * MediaQuery.of(context).size.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            categoreis.length,
            (index) => BuildCarts(
                categoreis[index]['icon'], categoreis[index]['text'], () {})),
      ),
    );
  }
}

class BuildCarts extends StatelessWidget {
  final String text, icon;
  final GestureTapCallback press;

  BuildCarts(this.icon, this.text, this.press);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: (55 / 375) * MediaQuery.of(context).size.width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(
                    (15 / 375) * MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  color: Color(0XFFE23E57),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                ),
              ),
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
