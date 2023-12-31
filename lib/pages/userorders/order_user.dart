import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/order/order_card.dart';
import 'package:gestlivreur/pages/services/order_service.dart';
import 'package:gestlivreur/pages/userorders/order_user_card.dart';
import 'package:get/get.dart';

class OrderUse extends ConsumerStatefulWidget {
  const OrderUse({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderUseState();
}

class _OrderUseState extends ConsumerState<OrderUse> {
  List<Order> selectedOrders = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    loader();
  }

  loader() async {
    try {
      selectedOrders = await OrderService.getordersuser();
      setState(() {});
    } catch (e) {
      // Handle the error, e.g., show an error message to the user
      // print('Error loading orders: $e');
      // You can use Get.snackbar for a simple error message
      Get.snackbar('Error', 'Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('Mes livraisons (${selectedOrders.length})')),
      body: SafeArea(
          child: Column(
        children: [
          selectedOrders.isNotEmpty
              ? ListView.builder(
                  itemCount: selectedOrders.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderCardUser(
                      order: selectedOrders[index],
                    );
                  },
                )
              : Center(
                  child: Text("Vous ne disposez pas  de commande"),
                ),
        ],
      )),
    );
  }
}
