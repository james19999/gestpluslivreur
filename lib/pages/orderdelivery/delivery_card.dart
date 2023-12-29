import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/colors/color.dart';

class DelivryCard extends ConsumerWidget {
  const DelivryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        onTap: () {
          // Get.to(() => CreateCart(
          //       id: clientModel.id,
          //       name: clientModel.name,
          //     ));
        },
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset("assets/images/reciv.png"),
            )),
        title: Text(
          "AHIAKPOR KOMLAN JAMES",
          // clientModel.name.toUpperCase(),
          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 13),
          maxLines: 1,
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  "1000000 XOF",
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
                Text(
                  "93 26 60 04 |",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      letterSpacing: 2),
                  maxLines: 1,
                ),
                Text(
                  "12:30",
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
          onPressed: () {
            // Get.to(() => ShowClient(client: clientModel),
            //     transition: Transition.fade);
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
