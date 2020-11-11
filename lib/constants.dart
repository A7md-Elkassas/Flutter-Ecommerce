import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFFBFD7EA);
const kTextColor = Color(0xFF757575);

const kTextFieldDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    // borderSide: BorderSide(color: kPrimaryColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(28)),
    // borderSide: BorderSide(color: kPrimaryColor),
  ),
);
