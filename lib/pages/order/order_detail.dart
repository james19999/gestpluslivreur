import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestlivreur/pages/constant/date_convert.dart';
import 'package:gestlivreur/pages/models/order.dart';
import 'package:gestlivreur/pages/services/order_service.dart';
import 'package:gestlivreur/pages/widgets/input.dart';
import 'package:get/get.dart';

class OrderDetail extends ConsumerStatefulWidget {
  final Order selectedOrders;
  const OrderDetail({super.key, required this.selectedOrders});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderDetailState();
}

class _OrderDetailState extends ConsumerState<OrderDetail> {
  @override
  final TextEditingController raison = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final seleclted = StateProvider((ref) => '');
  var tab = [
    "delivered",
    "canceled",
  ];
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
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
                        Textline(
                            "Nom", "${widget.selectedOrders.user['name']}"),
                        Textline("Téléphone",
                            "${widget.selectedOrders.user['phone']}"),
                        Textline("Adresse",
                            "${widget.selectedOrders.user['adresse']}"),
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
                        Textline(
                            "Nom", "${widget.selectedOrders.costumer.name}"),
                        Textline("Téléphone",
                            "${widget.selectedOrders.costumer.phone}"),
                        Textline("Adresse",
                            "${widget.selectedOrders.costumer.adresse}"),
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
                        Textline("Numéro", "${widget.selectedOrders.code}"),
                        Textline("Date",
                            "${DateConverter.estimatedDate(widget.selectedOrders.createdAt)}"),
                        Textline("Heur de livraison",
                            "${widget.selectedOrders.time}"),
                      ]),
                      //BoxDecoration
                    ), //Container
                  ) //Flexible
                ], //<Widget>[]
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HedarLine("Désignation"),
                  HedarLine("Prix"),
                  HedarLine("Quantité"),
                  HedarLine("Total"),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: widget.selectedOrders.orderItems.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var order = widget.selectedOrders.orderItems[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HedarLines(order.product.name),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: HedarLines("${order.product.price} XOF"),
                      ),
                      HedarLines(order.quantity),
                      HedarLines("${order.product.price * order.quantity} XOF"),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2.0,
                  );
                },
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textline(
                      "Sous-total", "${widget.selectedOrders.subtotal} XOF"),
                  Text(
                      "Etat: ${widget.selectedOrders.status == 'ordered' ? 'En cours' : widget.selectedOrders.status == 'delivered' ? 'Livré' : widget.selectedOrders.status == 'canceled' ? 'Annuler' : ''}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: widget.selectedOrders.status == 'ordered'
                              ? Colors.amber
                              : widget.selectedOrders.status == 'delivered'
                                  ? Colors.green
                                  : widget.selectedOrders.status == 'canceled'
                                      ? Colors.red
                                      : Colors.transparent)),
                ],
              ),
              SizedBox(
                height: Get.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textline(
                      "Frais de livraison", "${widget.selectedOrders.tax} XOF"),
                ],
              ),
              SizedBox(
                height: Get.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textline("Total", "${widget.selectedOrders.total} XOF"),
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 80.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: tab.length,
                shrinkWrap: true, // Number of items in the grid
                itemBuilder: (context, index) {
                  // Build each grid item
                  return TextButton(
                      onPressed: () async {
                        ref.watch(seleclted.notifier).state = tab[index];
                        if (ref.watch(seleclted.notifier).state == 'canceled') {
                          Get.defaultDialog(
                              title: 'Annuler la commande',
                              radius: 4,
                              content: Form(
                                  key: _form,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25),
                                    child: InputFild(
                                      icon: Icon(Icons.cancel),
                                      hintText: 'Raison',
                                      controlle: raison,
                                      validator: (value) => value!.isEmpty
                                          ? "Entrer la raison".tr
                                          : null,
                                    ),
                                  )),
                              confirm: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.57,
                                color: Colors.green,
                                child: TextButton(
                                  onPressed: () async {
                                    if (_form.currentState!.validate()) {
                                      await OrderService.validerorder(
                                          widget.selectedOrders.id,
                                          ref.watch(seleclted.notifier).state,
                                          raison.text);
                                    }
                                  },
                                  child: Text(
                                    'Valider',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              cancel: Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.57,
                                color: Colors.red,
                                child: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Retour",
                                        style: TextStyle(color: Colors.white))),
                              ));
                        } else {
                          await OrderService.validerorder(
                              widget.selectedOrders.id,
                              ref.watch(seleclted.notifier).state,
                              raison.text);
                        }
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.5,
                        color: tab[index] == 'delivered'
                            ? Colors.green
                            : tab[index] == 'canceled'
                                ? Colors.red
                                : Colors.transparent,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${tab[index] == 'delivered' ? 'Valider' : tab[index] == 'canceled' ? 'Annuler' : ''}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ));
                },
              ),
              widget.selectedOrders.avis != null
                  ? Row(
                      children: [
                        Container(
                          height: Get.height * 0.1,
                          width: Get.width * 0.95,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5)),
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "${widget.selectedOrders.avis ?? ''}",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(''),
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
  SizedBox HedarLines(label) => SizedBox(
        width: 70,
        child: Text(
          "$label",
          style: TextStyle(),
          // maxLines: 1,
        ),
      );

  Text Textline(label1, label2) => Text("$label1 : $label2");
}
