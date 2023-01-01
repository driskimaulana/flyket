class Schedule {
  final int id, flight_id, from_airport, to_airport, passanger, capacity, current_airport;
  final String departure_time, arrival_time, code, fClass;
  final int cost;

  Schedule(this.id, this.flight_id, this.from_airport, this.to_airport, this.passanger, this.capacity, this.current_airport, this.departure_time, this.arrival_time, this.code, this.fClass, this.cost);

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(json["id"], json["flight_id"], json["from_airport"], json["to_airport"], json["passenger"], json["capacity"], json["current_airport"], json["departure_time"], json["arrival_time"], json["code"], json["fClass"], json["cost"]);
  }

}