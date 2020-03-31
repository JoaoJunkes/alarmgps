import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  double latitude = 0;

  @observable
  double longitude = 0;

  @observable
  String searchAddr;

  testeSnack(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      content: Text("Teste Snackbar")
    ));
  }

  @action
  findLocation() async {

  }

}
