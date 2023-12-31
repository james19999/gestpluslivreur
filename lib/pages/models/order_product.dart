import 'package:meta/meta.dart';
import 'dart:convert';

class OrderItemList {
  bool status;
  Order order;
  List<ProductElement> products;

  OrderItemList({
    required this.status,
    required this.order,
    required this.products,
  });

  factory OrderItemList.fromRawJson(String str) =>
      OrderItemList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItemList.fromJson(Map<String, dynamic> json) => OrderItemList(
        status: json["status"],
        order: Order.fromJson(json["order"]),
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order": order.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Order {
  int id;
  String userId;
  String costumerId;
  String subtotal;
  String tax;
  String total;
  dynamic motif;
  String code;
  String time;
  int statusOrder;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int take;
  int brouillon;
  int createdUser;
  dynamic avis;
  int remis;
  String montant;
  String type;
  List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.userId,
    required this.costumerId,
    required this.subtotal,
    required this.tax,
    required this.total,
    required this.motif,
    required this.code,
    required this.time,
    required this.statusOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.take,
    required this.brouillon,
    required this.createdUser,
    required this.avis,
    required this.remis,
    required this.montant,
    required this.type,
    required this.orderItems,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        costumerId: json["costumer_id"],
        subtotal: json["subtotal"],
        tax: json["tax"],
        total: json["total"],
        motif: json["motif"],
        code: json["code"],
        time: json["time"],
        statusOrder: json["status_order"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        take: json["take"],
        brouillon: json["brouillon"],
        createdUser: json["created_user"],
        avis: json["avis"],
        remis: json["remis"],
        montant: json["montant"],
        type: json["type"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "costumer_id": costumerId,
        "subtotal": subtotal,
        "tax": tax,
        "total": total,
        "motif": motif,
        "code": code,
        "time": time,
        "status_order": statusOrder,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "take": take,
        "brouillon": brouillon,
        "created_user": createdUser,
        "avis": avis,
        "remis": remis,
        "montant": montant,
        "type": type,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}

class OrderItem {
  int id;
  int productId;
  int orderId;
  String price;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  OrderItemProduct product;

  OrderItem({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.price,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory OrderItem.fromRawJson(String str) =>
      OrderItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        productId: json["product_id"],
        orderId: json["order_id"],
        price: json["price"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: OrderItemProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "order_id": orderId,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

class OrderItemProduct {
  int id;
  String name;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  int priceMarket;
  int qtInitial;
  int qtsSeuil;
  dynamic qtsSell;
  dynamic benefice;
  int priceBy;

  OrderItemProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.priceMarket,
    required this.qtInitial,
    required this.qtsSeuil,
    required this.qtsSell,
    required this.benefice,
    required this.priceBy,
  });

  factory OrderItemProduct.fromRawJson(String str) =>
      OrderItemProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderItemProduct.fromJson(Map<String, dynamic> json) =>
      OrderItemProduct(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        priceMarket: json["price_market"],
        qtInitial: json["qt_initial"],
        qtsSeuil: json["qts_seuil"],
        qtsSell: json["qts_sell"],
        benefice: json["benefice"],
        priceBy: json["price_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "price_market": priceMarket,
        "qt_initial": qtInitial,
        "qts_seuil": qtsSeuil,
        "qts_sell": qtsSell,
        "benefice": benefice,
        "price_by": priceBy,
      };
}

class ProductElement {
  int productId;
  String productName;
  String price;
  int quantity;

  ProductElement({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  factory ProductElement.fromRawJson(String str) =>
      ProductElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        productId: json["product_id"],
        productName: json["product_name"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "price": price,
        "quantity": quantity,
      };
}
