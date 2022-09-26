import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:online_cog/Constants/colors.dart';

import 'package:online_cog/Constants/dimensions.dart';
import 'package:online_cog/Views/Screens/ViewContents/ClientAccessScreens/nav_drawer.dart';

/// Profile page of the system, this is where user can edit, signout, and delete their account.
class ClientProfile extends StatefulWidget {
  const ClientProfile({super.key});

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
        drawer:
            (getScreenWidth(context) <= tabletWidth) ? const MyDrawer() : null,
        body: Row(children: [
          (getScreenWidth(context) > tabletWidth)
              ? const MyDrawer()
              : Container(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const UserAvatar(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const EditableUserDisplayName(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      auth.currentUser!.email!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )),
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
