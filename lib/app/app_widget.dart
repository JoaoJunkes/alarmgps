import 'package:alarmgps/app/utils/theme/theme.dart';
import 'package:alarmgps/app/utils/theme/themeDark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  ThemeData theme = primaryTheme;
  ThemeData themeDark = primaryThemeDark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Alarm GPS',
      theme: themeDark,
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
