class Plant {
  late int id;
  late String name;
  late String scName;
  late String temp;
  late String water;
  late String soilType;
  late String description;
  late String image;
  late String category;
  late int fert;

  Plant(
      {required this.id,
      required this.name,
      required this.scName,
      required this.temp,
      required this.water,
      required this.soilType,
      required this.description,
      required this.image,
      required this.category,
      required this.fert});

  Plant.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.scName = json["scName"];
    this.temp = json["temp"];
    this.water = json["water"];
    this.soilType = json["soilType"];
    this.description = json["description"];
    this.image = json["image"];
    this.category = json["category"];
    this.fert = json["fert"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["scName"] = this.scName;
    data["temp"] = this.temp;
    data["water"] = this.water;
    data["soilType"] = this.soilType;
    data["description"] = this.description;
    data["image"] = this.image;
    data["category"] = this.category;
    data["fert"] = this.fert;
    return data;
  }
}
