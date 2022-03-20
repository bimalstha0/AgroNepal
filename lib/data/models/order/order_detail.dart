import '../product/cart_item.dart';

class OrderDetails {
  int? id;
  late List<CartItem> items;
  String? total;
  String? shippingAddress;
  String? phoneNumber;
  String? dateOrdered;
  bool? paymentStatus;
  String? paymentMethod;
  String? status;
  int? user;

  OrderDetails(
      {this.id,
      required this.items,
      this.total,
      this.shippingAddress,
      this.phoneNumber,
      this.dateOrdered,
      this.paymentStatus,
      this.paymentMethod,
      this.status,
      this.user});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.items = json["items"] == null
        ? []
        : (json["items"] as List).map((e) => CartItem.fromJson(e)).toList();
    this.total = json["total"];
    this.shippingAddress = json["shipping_address"];
    this.phoneNumber = json["phone_number"];
    this.dateOrdered = json["date_ordered"];
    this.paymentStatus = json["payment_status"];
    this.paymentMethod = json["payment_method"];
    this.status = json["status"];
    this.user = json["user"];
  }
}
