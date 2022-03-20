class EditProfileRequest {
  String email;
  String name;

  EditProfileRequest({required this.email, required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["name"] = this.name;
    return data;
  }
}
