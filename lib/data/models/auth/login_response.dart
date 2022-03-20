class LoginResponse {
  int? id;
  String? email;
  String? name;
  String? token;

  LoginResponse(
      {required this.id,
      required this.email,
      required this.name,
      required this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["email"] is String) this.email = json["email"];
    if (json["name"] is String) this.name = json["name"];
    if (json["token"] is String) this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    data["token"] = this.token;
    return data;
  }
}
