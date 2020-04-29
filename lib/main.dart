import 'package:flutter/material.dart';

import 'core/theme/theme_barrel.dart';
import 'routes.dart';

void main() async => MediaInfo.setOrientationAndMediaQuery().then((_) => runApp(HouseKeeping()));

///stateful widget that calls MainApp
///for any stateful house keeping
class HouseKeeping extends StatefulWidget {
  HouseKeeping({Key key}) : super(key: key);

  @override
  _HouseKeepingState createState() => _HouseKeepingState();
}

class _HouseKeepingState extends State<HouseKeeping> with WidgetsBindingObserver {
  bool timerStoppedByMe = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    ///listen for orientation or other dim changes
    MediaInfo.setMediaInfo();
    //print('metrics changed:' + MediaInfo.toPrint());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new MainApp(),
    );
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) => MaterialApp(
              key: Key(orientation.toString()),
              debugShowCheckedModeBanner: false,
              title: 'Hivesey',
              theme: ThemeModule().get<Contemporary>().getTheme(),
              routes: Routes().routes(),
              initialRoute: Routes.initialRoute,
            ));
  }
}
