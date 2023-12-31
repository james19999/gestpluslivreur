import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/models/user.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class UserService {
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
            username: result['user']['name'], token: result['token']);
        return true;
      } else {
        return false;
      }
    }
  }

  LogoutUser() async {
    var url = Uri.parse("${BaseUrl}logout/user");
    final response = await http
        .post(url, headers: {"Authorization": "Bearer ${localstorage.token}"});

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result['status'] == true) {
        localstorage.deletetoken;
        localstorage.deletename;
        return true;
      }
    }
  }
}
