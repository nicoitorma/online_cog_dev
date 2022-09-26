import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Constants/admin_secret_key.dart';
import 'package:online_cog/Views/Screens/ViewContents/AdminAccess/admin_home_page.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/request_cog.dart';

class TabletView extends StatefulWidget {
  final User user;
  const TabletView({super.key, required this.user});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    if (widget.user.email!.contains(adminSecretKey)) {
      return const AdminPage();
    }
    //default Screen
    return const RequestCog();
  }
}
