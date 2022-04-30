class SignUpBody {
  String name;
  String contuct;
  String email;
  String password;
  SignUpBody(
      {required this.name,
      required this.contuct,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["contuct"] = this.contuct;
    data['email'] = this.email;
    data['password'] = this.password; 
    return data;
  }
}
