import 'package:flutter/material.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Constants/widgets.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/nav_drawer.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
              color: fontColor,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
        ),
        drawer:
            (getScreenWidth(context) <= tabletWidth) ? const MyDrawer() : null,
        body: Row(children: [
          (getScreenWidth(context) > tabletWidth)
              ? const MyDrawer()
              : Container(),
          Expanded(
              child: Center(
            child: Text(
              "HEHE DI KO PA NAGAGAWA, NAUBOS NA KAPE KO",
              style: TextStyle(fontSize: 24),
            ),
          ))
        ]));
  }
}
