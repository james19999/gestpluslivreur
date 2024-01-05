import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/services/order_service.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class OrderController extends ChangeNotifier {
  List<Order> orders = [];
  List<Order> orderslist = [];
  double total = 0;
  OrderController() {
    getallorderlist();
    getordelist();
  }
  Future<void> getSum() async {
    total = orders.fold(0,
        (previousValue, element) => previousValue + int.parse(element.total));
    notifyListeners();
  }

  getordelist() async {
    try {
      orderslist = await OrderService.getorders();
    } catch (e) {}
    notifyListeners();
  }

  getallorderlist() async {
    try {
      orders = await OrderService.getorderslist();

      await getSum();
    } catch (e) {}

    notifyListeners();
  }
}

final OrderProvider = ChangeNotifierProvider<OrderController>(
  (ref) {
    return OrderController();
  },
);
