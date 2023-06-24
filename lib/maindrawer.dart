import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  MainDrawer() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Hello, ${auth.currentUser!.displayName}',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // ListTile(
        //   leading: Icon(Icons.settings, size: 26),
        //   title: Text('Settings'),
        //   onTap: () {},
        // ),
        Theme(
          data: ThemeData(
            splashColor: Colors.blue[100],
            highlightColor: Colors.blue.withOpacity(.5),
          ),
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onTap: () {},
          ),
        ),
        Theme(
            data: ThemeData(
              splashColor: Colors.blue[100],
              highlightColor: Colors.blue.withOpacity(.5),
            ),
            child: ListTile(
              leading: Icon(
                Icons.man,
                size: 26,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Profile", style: TextStyle(color: Theme.of(context).primaryColor)),
              onTap: () {},
            ))
      ]),
    );
  }
}
