import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/auth_services.dart';
import 'package:personal_app/maindrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      drawer: MainDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 30,
              icon: Icon(Icons.home),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'WELCOME',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Theme.of(context).backgroundColor),
          )
        ],
      ),
      body: Container(
        child: Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
      ),
    );
  }
}
