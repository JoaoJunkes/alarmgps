import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  String searchAddr;

  @observable
  MapType mapType = MapType.hybrid;

  @action
  alterTypeMap() async {
    mapType = mapType == MapType.normal ? MapType.hybrid : MapType.normal;
  }

}
