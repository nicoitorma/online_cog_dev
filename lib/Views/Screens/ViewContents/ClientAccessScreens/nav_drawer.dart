import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:online_cog/Accounts/authentication.dart';
import 'package:online_cog/Constants/colors.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/notifications.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/client_profile.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/request_cog.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
            color: Colors.blue,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/cict_logo.png"),
                  ),
                  menuItem(
                    title: "Request COG",
                    icon: Icons.feed_outlined,
                    onClicked: () => itemSelected(context, 0),
                  ),
                  menuItem(
                    title: "Notifications",
                    icon: Icons.notifications_outlined,
                    onClicked: () => itemSelected(context, 1),
                  ),
                  menuItem(
                    title: "Profile",
                    icon: Icons.person_outline,
                    onClicked: () => itemSelected(context, 2),
                  ),
                  menuItem(
                      title: "Sign out",
                      icon: Icons.logout_outlined,
                      onClicked: () => itemSelected(context, 3))
                ],
              ),
            )));
  }

  /// this will return a menu item for the navigation drawer
  Widget menuItem(
      {required String title,
      required IconData icon,
      VoidCallback? onClicked}) {
    return ListTile(
      leading: Icon(icon, color: fontColor),
      title: Text(
        title,
        style: const TextStyle(color: fontColor),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void itemSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RequestCog()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Notifications()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ClientProfile()));
        break;
      case 3:
        FlutterFireUIAuth.signOut();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Authentication()));
        break;
    }
  }
}
