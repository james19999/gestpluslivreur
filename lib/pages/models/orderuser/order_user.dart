import 'package:meta/meta.dart';
import 'dart:convert';

class Order {
  dynamic id;
  dynamic userId;
  dynamic costumerId;
  dynamic subtotal;
  dynamic tax;
  dynamic total;
  dynamic? motif;
  dynamic code;
  dynamic time;
  dynamic statusOrder;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic take;
  dynamic brouillon;
  dynamic createdUser;
  dynamic? avis;
  dynamic remis;
  dynamic montant;
  dynamic type;
  Costumer costumer;
  Costumer user;
  List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.userId,
    required this.costumerId,
    required this.subtotal,
    required this.tax,
    required this.total,
    this.motif,
    required this.code,
    required this.time,
    required this.statusOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.take,
    required this.brouillon,
    required this.createdUser,
    this.avis,
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
        user: Costumer.fromJson(json["user"]),
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
        "user": user.toJson(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}

class Costumer {
  dynamic id;
  dynamic name;
  dynamic? email;
  dynamic? phone;
  dynamic? adresse;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userId;
  DateTime emailVerifiedAt;
  dynamic userType;

  Costumer({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.adresse,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.emailVerifiedAt,
    required this.userType,
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
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        userType: json["user_type"],
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
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "user_type": userType,
      };
}

class OrderItem {
  dynamic id;
  dynamic productId;
  dynamic orderId;
  dynamic price;
  dynamic quantity;
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
  dynamic id;
  dynamic name;
  dynamic price;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic priceMarket;
  dynamic qtInitial;
  dynamic qtsSeuil;
  dynamic qtsSell;
  dynamic benefice;
  dynamic priceBy;

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
