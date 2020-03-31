import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'loading_controller.g.dart';

class LoadingController = _LoadingControllerBase with _$LoadingController;

abstract class _LoadingControllerBase with Store {

  Geolocator _location = Modular.get<Geolocator>();

  Future<Position> loadLocation() async {
    return await _location.getCurrentPosition();
  }

}
