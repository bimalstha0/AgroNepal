class UserProfile {
  int? id;
  String? email;
  String? name;

  UserProfile({this.id, this.email, this.name});

  UserProfile.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    return data;
  }
}
