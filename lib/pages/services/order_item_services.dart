import 'dart:convert';

import 'package:gestlivreur/pages/models/order_product.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;
import 'package:gestlivreur/pages/helper/local_storage.dart';

class OrderItemService {
  static Future<List<Order>> orderdetail(id) async {
    var url = Uri.parse("${BaseUrl}order/detail/$id");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['order'];
      var prod = result['products'];
      print(prod);
      return List<Order>.from(prod.map((orders) => Order.fromJson(orders)));
    } else {
      throw Exception('fail to loader');
    }
  }
}
