import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_app/home.dart';
import 'package:personal_app/login.dart';

// final GoogleSignIn? googleUser = GoogleSignIn(scopes: <String>["email"]);

class AuthService {
  handleAuthSave() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return homepage
            print('lol');
            AuthService().signInWithGoogle(context);

            return HomePage();
          } else {
            //return loginpage
            return LoginPage();
          }
        });
  }

  //function to be called on pressing sign in button
  signInWithGoogle(context) async {
    //triggers authentication flow - get the email/gmail id from the device
    print("lol1");
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();

    BuildContext dialogContext;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return AlertDialog(
          content: new Row(
            children: [
              CircularProgressIndicator(),
              Container(margin: EdgeInsets.only(left: 7), child: Text("Signing in...")),
            ],
          ),
        );
      },
    );

    print("lol2");
    //obtain auth details from request - wait for authentication from google server
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    print("lol3");
    //create a new credential
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    print(credential);
    //Once signed in, return UserCredential
    // await googleUser.signIn();

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pop(context);
  }

  signOut() async {
    // await googleUser?.signOut();
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
