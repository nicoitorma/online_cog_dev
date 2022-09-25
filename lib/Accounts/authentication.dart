import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:online_cog/Views/home_page.dart';

/// A widget for Sign in and register function of the app using
/// the flutterfire_ui library.
///
/// This class is called from the [home_page] file
class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //this will check if there is no signed in user
        if (!snapshot.hasData) {
          return MaterialApp(
            color: Colors.blue,
            theme: ThemeData(
              /// Decoration for input fields like email, and password in the sign up
              /// and register page
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              /// Decoration for button like sign in, and register in the sign up
              /// and register page
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ),
            home: SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/images/cict_logo.png"),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to CICT Online Certificate of Grades.'
                        : 'Please create an account to continue',
                  ),
                );
              },
              sideBuilder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/images/cict_logo.png"),
                  ),
                );
              },
              footerBuilder: (context, _) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          );
        }

        /// this class will return [home_page] if the user is not null
        return HomePage(
          user: snapshot.data!,
        );
      },
    );
  }
}
