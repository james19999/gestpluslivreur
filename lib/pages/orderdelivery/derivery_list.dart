import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/order/order_card.dart';
import 'package:gestlivreur/pages/orderdelivery/order_delivry_card.dart';
import 'package:gestlivreur/pages/services/order_item_services.dart';
import 'package:gestlivreur/pages/services/order_service.dart';
import 'package:get/get.dart';

class DelivryList extends ConsumerStatefulWidget {
  const DelivryList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DelivryListState();
}

class _DelivryListState extends ConsumerState<DelivryList> {
  List<Order> selectedOrders = [];
  @override
  void initState() {
    super.initState();

    loader();
  }

  loader() async {
    try {
      selectedOrders = await OrderService.getorderslist();

      setState(() {});
    } catch (e) {
      // Handle the error, e.g., show an error message to the user
      // You can use
      Get.snackbar('Error', 'Failed to load $e ');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('Commandes livrées ')),
      body: SafeArea(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: selectedOrders.length,
        itemBuilder: (context, index) {
          return DelivryCard(
            order: selectedOrders[index],
          );
        },
      )),
    );
  }
}
