import 'package:alarmgps/app/modules/loading/loading_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class LoadingPage extends StatefulWidget {
  final String title;
  const LoadingPage({Key key, this.title = "Loading"}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends ModularState<LoadingPage, LoadingController> {

  Position currentLocation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      _loadCurrentLoation();
    });

    Future.delayed(Duration(seconds: 4)).then((_) {
      Modular.to.pushReplacementNamed('/home', arguments: currentLocation);
    });
  }

  _loadCurrentLoation() async {
    controller.loadLocation().whenComplete(() async {
      currentLocation = await controller.loadLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Container(
            child:
              FlareActor("assets/loadingMap.flr", animation: "load", ),
          ),
        )
    );
  }
}