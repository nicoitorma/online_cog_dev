import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:online_cog/Constants/string_constants.dart';

var myAppBar = AppBar(
  title: const Text(appBarTitle),
);

var myDrawer = Drawer(
    backgroundColor: Colors.blue,
    child: SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("lib/assets/images/cict.jpg"),
          ),
          const ListTile(
            leading: Icon(
              Icons.feed_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Request COG",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            title: Text("Notifications", style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            title: Text("Profile", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FlutterFireUIAuth.signOut(),
              child:
                  const Text("Sign out", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    ));

void showAlertDialog(BuildContext context, String title, String? schoolYear,
    String? semester, String? contents) {
  showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          title: Text(title),
          content: Text(
              "Your request of COG for school year $schoolYear, semester $semester \nhas been submitted."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK")),
          ],
        )),
  );
}
