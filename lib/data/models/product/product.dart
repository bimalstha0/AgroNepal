class Product {
  late int id;
  late String name;
  late String description;
  late double price;
  late String image;
  late String category;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.description = json["description"];
    if (json['price'] is double)
      this.price = json['price'];
    else
      this.price = double.parse(json['price'].toString());
    this.image = json["image"];
    this.category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["price"] = this.price;
    data["image"] = this.image;
    data["category"] = this.category;
    return data;
  }
}
