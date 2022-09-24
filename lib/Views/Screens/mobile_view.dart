import 'package:flutter/material.dart';

import 'package:online_cog/Views/Screens/ViewContents/request_cog.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    //default screen
    return const RequestCog();
  }
}
