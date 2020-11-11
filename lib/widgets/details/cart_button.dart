import 'package:flutter/material.dart';
import '../../constants.dart';

class CartButton extends StatelessWidget {
  final GestureTapCallback pressCallback;
  CartButton({this.pressCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 375) * MediaQuery.of(context).size.width,
          vertical: (20 / 375) * MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.15,
          right: MediaQuery.of(context).size.width * 0.15,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: RaisedButton(
            color: kPrimaryColor,
            onPressed: pressCallback,
            child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: (20 / 375) * MediaQuery.of(context).size.width,
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )),
          ),
        ),
      ),
    );
  }
}
