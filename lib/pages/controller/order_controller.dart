import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/models/user.dart';
import 'package:gestlivreur/pages/services/order_service.dart';
import 'package:gestlivreur/pages/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class OrderController extends ChangeNotifier {
  List<dynamic> orders = [];
  OrderController() {
    // getallorder();
  }

  // getallorder() async {
  //   try {
  //     orders = await OrderService.getOrders();
  //   } catch (e) {
  //     // print("Error: de connexion au serveur");
  //   }

  //   notifyListeners();
  // }
}

final OrderProvider = ChangeNotifierProvider<OrderController>(
  (ref) {
    return OrderController();
  },
);
