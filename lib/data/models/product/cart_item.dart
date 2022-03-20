import 'product.dart';

class CartItem {
  late Product product;
  late int quantity;

  CartItem(this.product, this.quantity);

  CartItem.fromJson(Map<String, dynamic> json) {
    this.product = json["product"] == null
        ? Product(
            id: 0,
            name: 'NA',
            description: '',
            price: 0,
            image: '',
            category: '')
        : Product.fromJson(json["product"]);
    this.quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) data["product"] = this.product.toJson();
    data["quantity"] = this.quantity;
    return data;
  }
}
