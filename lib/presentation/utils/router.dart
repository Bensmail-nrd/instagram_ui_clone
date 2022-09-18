import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/screen/signin.dart';

import '../screen/home_screen.dart';

class PageRouter {
  MaterialPageRoute? router(RouteSettings settings) {
    FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser != null) {
      if (settings.name == '/') {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      }
    } else {
      return MaterialPageRoute(
        builder: (context) => SignIn(),
      );
    }

    return null;
  }
}
