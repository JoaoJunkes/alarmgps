import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  String searchAddr;

  @observable
  MapType mapType = MapType.hybrid;

  @observable
  Position positionNow = Position();

  Geolocator location = Modular.get<Geolocator>();

  GoogleMapController mapController;

  @action
  alterTypeMap() async {
    mapType = mapType == MapType.normal ? MapType.hybrid : MapType.normal;
  }

  @action
  loadLocation() async {
    while(true) {
      Future.delayed(Duration(seconds: 2));
      positionNow = await location.getCurrentPosition();

      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(positionNow.latitude, positionNow.longitude),
          zoom: 14.4746
        )
      ));

    }
  }

}
