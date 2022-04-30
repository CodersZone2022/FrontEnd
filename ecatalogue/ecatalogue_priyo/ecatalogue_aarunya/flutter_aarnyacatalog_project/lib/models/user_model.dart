class UserModel {
  int id;
  String name;
  String email;
  String contuct;
  int orderCount;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contuct,
    required this.orderCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['f_name'],
        email: json['email'],
        contuct: json['contuct'],
        orderCount: json['order_Count']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "contuct": this.contuct,
      "orderCount": this.orderCount
    };
  }
}
