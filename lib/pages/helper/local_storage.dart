import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class localstorage {
  localstorage();
  static final storage = GetStorage();

  static get username => storage.read("username") ?? '';
  static get token => storage.read("token");

  static get deletetoken => storage.remove("token");
  static get deletename => storage.remove("username");

  static costumerinfo({username, token}) async {
    storage.write("username", username);
    storage.write("token", token);
  }
}
