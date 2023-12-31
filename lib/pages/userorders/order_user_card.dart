import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/colors/color.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/order/order_detail.dart';
import 'package:gestlivreur/pages/services/order_item_services.dart';
import 'package:get/get.dart';

class OrderCardUser extends ConsumerWidget {
  final Order order;

  const OrderCardUser({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(() => OrderDetail(selectedOrders: order),
              transition: Transition.fade);
        },
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset("assets/images/ords.png"),
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
                    "${order.costumer.phone} |",
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
            Get.to(() => OrderDetail(selectedOrders: order),
                transition: Transition.fade);
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: AppColors.mainColors,
          ),
        ),
      ),
    );
  }
}
