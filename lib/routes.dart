import 'package:flutter/material.dart';

import './page/home_page.dart';
import './screens/home_screen.dart';
import './screens/image_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => ImagesPage());

      case ImageScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ImageScreen(
                  args: settings.arguments,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
