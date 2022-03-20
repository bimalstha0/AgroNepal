class Order {
  int? id;
  String? total;
  String? dateOrdered;
  String? status;

  Order({this.id, this.total, this.dateOrdered, this.status});

  Order.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.total = json["total"];
    this.dateOrdered = json["date_ordered"];
    this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["total"] = this.total;
    data["date_ordered"] = this.dateOrdered;
    data["status"] = this.status;
    return data;
  }
}
