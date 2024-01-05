import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/colors/color.dart';
import 'package:gestlivreur/pages/controller/order_controller.dart';
import 'package:gestlivreur/pages/helper/local_storage.dart';
import 'package:gestlivreur/pages/login/login.dart';
import 'package:gestlivreur/pages/order/order_list.dart';
import 'package:gestlivreur/pages/orderdelivery/derivery_list.dart';
import 'package:gestlivreur/pages/services/user_services.dart';
import 'package:gestlivreur/pages/userorders/order_user.dart';
import 'package:get/get.dart';

class Admin extends ConsumerWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contoller = ref.watch(OrderProvider);
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height * 0.06,
            width: Get.width,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.defaultDialog(
                    content: Icon(
                      Icons.logout_outlined,
                      size: 50,
                      color: AppColors.mainColors,
                    ),
                    title: "",
                    radius: 4,
                    confirm: TextButton(
                      onPressed: () async {
                        var check = await UserService().LogoutUser();
                        if (check == true) {
                          Get.offAll(() => LoginPage(),
                              transition: Transition.fade);
                        }
                      },
                      child: Text("Se deconnecter"),
                    ),
                    cancel: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Annuler")));
              },
              label: Text("Se deconnecter"),
              icon: Icon(Icons.logout_outlined),
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('${localstorage.username}'),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(children: [
              Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
            ]),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  contoller.getallorderlist();
                },
                icon: Icon(
                  Icons.refresh_sharp,
                  size: 30,
                ))
          ],
        ),
        body: Center(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.04,
                ),

                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => OrderList());
                        },
                        child: Container(
                          height: Get.height * 0.19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ), //BoxDecoration
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/ord.png",
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Liste des livraisons",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 20,
                    ), //SizedBox
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => OrderUse());
                        },
                        child: Container(
                          height: Get.height * 0.19,
                          width: Get.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          //BoxDecoration
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/ords.png",
                                  height: 50,
                                ),
                                Text(
                                  "Mes livraisons",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ]),
                        ),
                      ), //Container
                    ) //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ), //Row
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: Get.height * 0.19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ), //BoxDecoration
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/mos.png",
                                  height: 50,
                                ),
                                Text(
                                  "Solde des livraisons",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  "${contoller.total} XOF",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 20,
                    ), //SizedBox
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DelivryList());
                        },
                        child: Container(
                          height: Get.height * 0.19,
                          width: Get.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          //BoxDecoration
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/reciv.png",
                                  height: 50,
                                ),
                                Text(
                                  "Commandes livrées",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  "${contoller.orders.length}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ), //Container
                    ) //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ), //Row
              ], //<Widget>[]
              crossAxisAlignment: CrossAxisAlignment.center,
            ), //Column
          ) //Padding
              ), //Container
        ) //Center
        );
  }
}
