import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/userorders/order_user_card.dart';
import 'package:get/get.dart';

class OrderUse extends ConsumerWidget {
  const OrderUse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('Mes livraisons')),
      body: SafeArea(child: ListView.builder(
        itemBuilder: (context, index) {
          return OrderCardUser();
        },
      )),
    );
  }
}
