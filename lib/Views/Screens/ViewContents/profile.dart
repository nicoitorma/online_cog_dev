import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:online_cog/Accounts/authentication.dart';
import 'package:online_cog/Constants/colors.dart';

import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Constants/widgets.dart';

/// Profile page of the system, this is where user can edit, signout, and delete their account.
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    var home = Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              color: fontColor,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
        ),
        drawer: (screenSize.width <= tabletWidth) ? const MyDrawer() : null,
        body: Row(children: [
          (screenSize.width > tabletWidth) ? const MyDrawer() : Container(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: ProfileScreen(
                actions: [
                  SignedOutAction((context) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Authentication()));
                  }),
                ],
              ),
            ),
          ),
        ]));

    return MaterialApp(
      theme: ThemeData(),
      localizationsDelegates: [
        // Creates an instance of FirebaseUILocalizationDelegate with overridden labels
        FlutterFireUILocalizations.withDefaultOverrides(
            const NameLocalization()),

        // Delegates below take care of built-in flutter widgets
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        // This delegate is required to provide the labels that are not overridden by LabelOverrides
        FlutterFireUILocalizations.delegate,
      ],
      home: home,
    );
  }
}

class NameLocalization extends DefaultLocalizations {
  const NameLocalization();

  @override
  String get name => 'ID number';
}
