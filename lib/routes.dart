import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home/home_barrel.dart';

class Routes {
  static Routes _instance = Routes._init();

  factory Routes() => _instance;

  static final String initialRoute = '/';

  Routes._init();

  ///handle routes on widgets that do NOT need input args
  Map<String, WidgetBuilder> routes() => {
        initialRoute: (context) => HomeScreen(),
      };

  ///handle routes on widgets that NEED input args
  generateRoutes() => (RouteSettings settings) {
        //Map args = settings.arguments;
        return <String, MaterialPageRoute>{}[settings.name];
      };

  ///common method to get MaterialPageRoute
  /*
  MaterialPageRoute _getRoute(Widget screen) => MaterialPageRoute(
        maintainState: true,
        builder: (context) {
          return screen;
        },
      );
      */
}
