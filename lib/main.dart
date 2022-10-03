import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_cog/Accounts/authentication.dart';
import 'package:online_cog/Constants/firebase_constants.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: apiKey,
            appId: appId,
            messagingSenderId: messagingSenderId,
            projectId: projectId));
    // Disable persistence on web platforms
    await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  } else {
    await Firebase.initializeApp();
  }

  runApp(const OnlineCog());
}

class OnlineCog extends StatefulWidget {
  const OnlineCog({super.key});

  @override
  State<OnlineCog> createState() => _OnlineCogState();
}

class _OnlineCogState extends State<OnlineCog> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        FirebaseAuth.instance.signOut();
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online COG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Authentication(),
    );
  }
}
