import 'package:flutter/material.dart';

class GameChoice {
  String _choice = "tesoura";

  String get choice {
    return _choice;
  }

  set choice(String choice) {
    _choice = choice;
  }

  Image _appImage = Image.asset("assets/papel.png");

  Image get appImage {
    return _appImage;
  }

  set appImage(Image appImage) {
    _appImage = appImage;
  }

  String _userLabel = "";

  String get userLabel {
    return _userLabel;
  }

  set userLabel(String userLabel) {
    _userLabel = userLabel;
  }
}
