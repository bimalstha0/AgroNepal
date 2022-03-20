class OrderRequest {
  String shippingAddress;
  String phoneNumber;
  String paymentMethod;
  bool paymentStatus;
  List<OrderItems> orderItems;

  OrderRequest(
      {required this.shippingAddress,
      required this.phoneNumber,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.orderItems});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["shipping_address"] = this.shippingAddress;
    data["phone_number"] = this.phoneNumber;
    data["payment_method"] = this.paymentMethod;
    data["payment_status"] = this.paymentStatus;
    if (this.orderItems != null)
      data["order_items"] = this.orderItems.map((e) => e.toJson()).toList();
    return data;
  }
}

class OrderItems {
  int product;
  int quantity;

  OrderItems({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["product"] = this.product;
    data["quantity"] = this.quantity;
    return data;
  }
}
