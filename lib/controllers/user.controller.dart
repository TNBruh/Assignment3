import 'package:get/get.dart';
import 'dart:developer';

class User extends GetxController {
  String _username = "amogus";

  String get username {
    return _username;
  }

  set username(String usr) {
    _username = usr;
  }
}
