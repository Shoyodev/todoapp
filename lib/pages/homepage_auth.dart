import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/authpage.dart';
import 'package:todo_app/pages/homepage.dart';

class Homepageauth extends StatefulWidget {
  const Homepageauth({Key? key}) : super(key: key);

  @override
  State<Homepageauth> createState() => _HomepageauthState();
}

class _HomepageauthState extends State<Homepageauth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return const Authpage();
        }
      }),
    );
  }
}
