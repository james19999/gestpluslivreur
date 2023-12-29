import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/order/order_card.dart';
import 'package:get/get.dart';

class OrderList extends ConsumerWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('Liste des livraisons')),
      body: SafeArea(child: ListView.builder(
        itemBuilder: (context, index) {
          return OrderCard();
        },
      )),
    );
  }
}
