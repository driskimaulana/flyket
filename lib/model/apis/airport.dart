class Airport {
  final String code, name, city, country;
  final int id;

  Airport(this.id, this.code, this.name, this.city, this.country);

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      json["id"],
      json["code"],
      json["name"],
      json["city.name"],
      json["country.name"],
    );
  }
}
