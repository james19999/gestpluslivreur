import 'package:meta/meta.dart';
import 'dart:convert';

class Temperatures {
  bool status;
  List<Order> order;

  Temperatures({
    required this.status,
    required this.order,
  });

  factory Temperatures.fromRawJson(String str) =>
      Temperatures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  int id;
  dynamic userId;
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
  Costumer costumer;
  dynamic user;
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
    required this.costumer,
    required this.user,
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
        costumer: Costumer.fromJson(json["costumer"]),
        user: json["user"],
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
        "costumer": costumer.toJson(),
        "user": user,
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}

class Costumer {
  int id;
  String name;
  dynamic email;
  String phone;
  String adresse;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  Costumer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.adresse,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory Costumer.fromRawJson(String str) =>
      Costumer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Costumer.fromJson(Map<String, dynamic> json) => Costumer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        adresse: json["adresse"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "adresse": adresse,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
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
  Product product;

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
        product: Product.fromJson(json["product"]),
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

class Product {
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

  Product({
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

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
