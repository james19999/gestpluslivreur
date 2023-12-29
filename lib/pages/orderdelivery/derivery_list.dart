import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/order/order_card.dart';
import 'package:gestlivreur/pages/orderdelivery/delivery_card.dart';
import 'package:get/get.dart';

class DelivryList extends ConsumerWidget {
  const DelivryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('Commandes livrées')),
      body: SafeArea(child: ListView.builder(
        itemBuilder: (context, index) {
          return DelivryCard();
        },
      )),
    );
  }
}
