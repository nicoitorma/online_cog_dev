import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Views/Screens/desktop_view.dart';
import 'package:online_cog/Views/Screens/mobile_view.dart';
import 'package:online_cog/Views/Screens/tablet_view.dart';
import 'package:online_cog/Views/responsive_layout.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileView: MobileView(user: user),
          tabletView: TabletView(user: user),
          desktopView: DesktopView(user: user)),
    );
  }
}
