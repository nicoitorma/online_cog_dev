import 'package:flutter/material.dart';

const mobileWidth = 600;
const tabletWidth = 1100;
const desktopWidth = 1080;
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
