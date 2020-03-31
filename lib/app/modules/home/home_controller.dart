import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  double latitude = 0;

  @observable
  double longitude = 0;

  @observable
  String searchAddr;

  @observable
  MapType mapType = MapType.hybrid;

  testeSnack(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      content: Text("Teste Snackbar")
    ));
  }

  @action
  alterTypeMap() async {
    mapType = mapType == MapType.normal ? MapType.hybrid : MapType.normal;
  }

}
