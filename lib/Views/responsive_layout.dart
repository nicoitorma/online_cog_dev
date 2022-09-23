import 'package:flutter/material.dart';
import 'package:online_cog/Constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  final Widget tabletView;

  const ResponsiveLayout(
      {super.key,
      required this.mobileView,
      required this.tabletView,
      required this.desktopView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileView;
      } else if (constraints.maxWidth < tabletWidth) {
        return tabletView;
      } else {
        return desktopView;
      }
    });
  }
}
