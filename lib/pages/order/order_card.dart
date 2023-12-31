import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/services/order_service.dart';

class OrderCard extends ConsumerWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        onTap: () async {
          await OrderService.addOrder(order.id);
        },
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset("assets/images/ord.png"),
            )),
        title: Text(
          order.costumer.name.toUpperCase(),
          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 13),
          maxLines: 1,
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  "${order.total} XOF",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      letterSpacing: 2),
                  maxLines: 1,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    "${order.costumer.phone}| ",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        letterSpacing: 2),
                    maxLines: 1,
                  ),
                ),
                Text(
                  "${order.time}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      letterSpacing: 2),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () async {
            await OrderService.addOrder(order.id);
          },
          icon: Icon(
            Icons.shopping_basket_sharp,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
