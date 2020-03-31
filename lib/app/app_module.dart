import 'package:alarmgps/app/modules/loading/loading_controller.dart';
import 'package:alarmgps/app/app_controller.dart';
import 'package:alarmgps/app/modules/home/home_controller.dart';
import 'package:alarmgps/app/modules/home/home_module.dart';
import 'package:alarmgps/app/modules/loading/loading_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:alarmgps/app/app_widget.dart';
import 'package:geolocator/geolocator.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoadingController()),
        Bind((i) => AppController()),
        Bind((i) => Geolocator()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoadingPage()),
        Router('/home', module: HomeModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
