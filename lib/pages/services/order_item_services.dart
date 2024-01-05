import 'dart:convert';

import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:gestlivreur/pages/helper/local_storage.dart';

import '../models/order.dart';

class OrderItemService {
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
