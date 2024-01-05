import 'dart:convert';

import 'package:gestlivreur/pages/admin/admin.dart';
import 'package:http/http.dart' as http;
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/toas/toas.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:gestlivreur/pages/userorders/order_user.dart';
import 'package:get/get.dart';

class OrderService {
  static Future<List<Order>> getorders() async {
    var url = Uri.parse("${BaseUrl}get/order/livrable");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['order'];
      // print(result);
      return List<Order>.from(result.map((orders) => Order.fromJson(orders)));
    } else {
      throw Exception('fail to loader');
    }
  }

  static Future<List<Order>> getordersuser() async {
    var url = Uri.parse("${BaseUrl}auth/user/livrable");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['orders'];
      return List<Order>.from(result.map((orders) => Order.fromJson(orders)));
    } else {
      throw Exception('fail to loader');
    }
  }

  static Future<void> addOrder(id) async {
    var url = Uri.parse("${BaseUrl}check/livraison/take/$id");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        if (result['status'] == true) {
          Toas.getSnackbarsucess(result["messages"].toString(), "");
          Get.to(() => OrderUse(), transition: Transition.fade);
        } else if (result['status'] == false) {
          Toas.getSnackbarEror(result["messages"].toString(), "");
        } else if (result['status'] == 400) {
          Toas.getSnackbarEror(result["messages"].toString(), "");
        }
      }
    } catch (e) {}
  }

  static Future<void> validerorder(id, status, String? motif) async {
    var url = Uri.parse("${BaseUrl}change/order:status/user/$id");
    var data = {'status': status.toString(), 'motif': motif.toString()};

    final response = await http.post(url,
        headers: {'Authorization': "Bearer ${localstorage.token}"}, body: data);

    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (result['status'] == true) {
          Toas.getSnackbarsucess(result["messages"].toString(), "");
          Get.to(() => Admin(), transition: Transition.fade);
        }
      }
    } catch (e) {}
  }

  static Future<List<Order>> getorderslist() async {
    var url = Uri.parse("${BaseUrl}auth/user/livrable/list");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['orders'];
      return List<Order>.from(result.map((order) => Order.fromJson(order)));
    } else {
      throw Exception('fail to loader');
    }
  }
}
