import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class PageRouter {
  MaterialPageRoute? router(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    }
    return null;
  }
}
