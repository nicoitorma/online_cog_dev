import 'package:flutter/material.dart';

import 'package:online_cog/Views/Screens/ViewContents/request_cog.dart';

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    //default Screen
    return const RequestCog();
  }
}
