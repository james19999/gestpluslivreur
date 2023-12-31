import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/models/user.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class UserCostumerController extends ChangeNotifier {
  UserCostumerController() {}

  // ignore: non_constant_identifier_names
  AuthUser(password, email) async {
    var data = {
      "email": email,
      "password": password,
    };
    var url = Uri.parse("${BaseUrl}login/user");
    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['status'] == true) {
        localstorage.costumerinfo(
            username: result['name'], token: result['token']);
        return true;
      } else {
        return false;
      }
    }
  }
}

final AuthProviders = ChangeNotifierProvider<UserCostumerController>(
  (ref) {
    return UserCostumerController();
  },
);
