import 'package:alarmgps/app/utils/alarm_input.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {

  final Position currentLocation;

  const HomePage({Key key, this.currentLocation}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(currentLocation);
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  final Position currentLocation;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _HomePageState(this.currentLocation);

  @override
  void initState() {
    super.initState();
    controller.loadLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Observer(
          builder: (_){
            return Stack(
              children: <Widget>[
                GoogleMap(
                  onLongPress: (info){
                    print(info);
                    showDialog(
                      context: _scaffoldKey.currentContext,
                      builder: (BuildContext context) {
                        return AlarmInput();
                      }
                    );
                  },
                  mapType: controller.mapType,
                  initialCameraPosition: getInitialPos(),
                  onMapCreated: (GoogleMapController googleController) {
                    controller.mapController = googleController;
                  },
                ),
                Positioned(
                  top: 30.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black45
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Aonde Vamos?',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: (){
                            searchAndNavigate();
                          },
                          iconSize: 30.0,
                        )
                      ),
                      onChanged: (value){
                        controller.searchAddr = value;
                      },
                    ),
                  ),
                ),
                Center(child: circleCenter)
              ],
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          controller.alterTypeMap();
        },
        label: Text('Altere a visão do mapa!', style: TextStyle(color: Colors.white),),
        icon: Icon(Icons.map, color: Colors.white,),
        backgroundColor: Colors.black54,
      ),
    );
  }

  searchAndNavigate() async {
    controller.location.placemarkFromAddress(controller.searchAddr).then((result) {
      controller.mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 14.4746
        )
      ));
    });
  }

  //-26.0790979, -53.0533527
  CameraPosition getInitialPos() {
    return CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 14.4746
    );
  }

  Widget circleCenter = new Container(
    width: 200.0,
    height: 200.0,
    child:
      FlareActor("assets/pointMap.flr", animation: "point", )
  );

}