import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class OrderDetail extends ConsumerWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail commande'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HedarLine("Livreur"),
                  HedarLine("Client"),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: HedarLine("Commande"),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ), //BoxDecoration
                      child: Column(children: [
                        Textline("Nom", "AHIAKPOR KOMLAN JAMES"),
                        Textline("Téléphone", "93 26 60 04"),
                        Textline("Adresse", "Lomé tokoin"),
                      ]),
                    ), //Container
                  ), //Flexible
                  SizedBox(
                    width: 20,
                  ), //SizedBox
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Textline("Nom", "AHIAKPOR KOMLAN JAMES"),
                        Textline("Téléphone", "93 26 60 04"),
                        Textline("Adresse", "Lomé tokoin"),
                      ]),
                      //BoxDecoration
                    ), //Container
                  ),
                  SizedBox(
                    width: 20,
                  ), //Flexible
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: Get.height * 0.2,
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Textline("Numéro", "AHDOJO-567"),
                        Textline("Date", "12/12/2023"),
                        Textline("Heur de livraison", "8:12"),
                      ]),
                      //BoxDecoration
                    ), //Container
                  ) //Flexible
                ], //<Widget>[]
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HedarLine("Désignation"),
                  HedarLine("Prix"),
                  HedarLine("Quantité"),
                  HedarLine("Total"),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HedarLines("Saceffffff"),
                      HedarLines("100"),
                      HedarLines("10"),
                      HedarLines("100000"),
                    ],
                  );
                },
              ),
              SizedBox(
                height: Get.height * 0.017,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: Get.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textline("Sous-total", 10000),
                  Container(
                    height: Get.height * 0.02,
                    color: Colors.amber,
                    width: Get.width * 0.3,
                  )
                ],
              ),
              Row(
                children: [
                  Textline("Frais de livraison", 10000),
                ],
              ),
              Row(
                children: [
                  Textline("Total", 10000),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.black,
                    height: Get.height * 0.03,
                    width: Get.width * 0.3,
                  ),
                  Container(
                    color: Colors.black,
                    height: Get.height * 0.03,
                    width: Get.width * 0.3,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text HedarLine(label) => Text(
        "$label",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      );
  Text HedarLines(label) => Text(
        "$label",
        style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 13),
        maxLines: 1,
      );

  Text Textline(label1, label2) => Text("$label1 : $label2");
}
