class User {
  final int id, avatar_id, biodata_id, balance;
  final String name, email, role, login_type, token;

  User(this.id, this.avatar_id, this.biodata_id, this.name, this.email,
      this.role, this.login_type, this.token, this.balance);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json["id"],
        json["avatar_id"],
        json["biodata_id"],
        json["name"],
        json["email"],
        json["role"],
        json["login_type"],
        json["token"],
        json["balance"]);
  }
}
