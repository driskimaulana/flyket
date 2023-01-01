class TransactionHistory {
  int id;
  String flightNo;
  String invoiceNumber;
  String transactionTime;
  String fromAirportName;
  String fromAirportCode;
  String toAirportName;
  String toAirportCode;
  String departureTime;
  String arrivalTime;
  String travelType;
  int adultPass;
  int childPass;
  int price;
  String createdAt;

  TransactionHistory(
      {required this.id,
      required this.flightNo,
      required this.invoiceNumber,
      required this.transactionTime,
      required this.fromAirportName,
      required this.fromAirportCode,
      required this.toAirportName,
      required this.toAirportCode,
      required this.departureTime,
      required this.arrivalTime,
      required this.travelType,
      required this.adultPass,
      required this.childPass,
      required this.price,
      required this.createdAt});

  factory TransactionHistory.fromJson(Map<String, dynamic> json) {
    return TransactionHistory(
        id: json['id'],
        flightNo: json['tickets'][0]['schedule']['flight']['code'],
        invoiceNumber: json['invoice_number'],
        transactionTime: json['transaction_time'],
        fromAirportName: json['tickets'][0]['schedule']['fromAirport']['name'],
        fromAirportCode: json['tickets'][0]['schedule']['fromAirport']['code'],
        toAirportName: json['tickets'][0]['schedule']['toAirport']['name'],
        toAirportCode: json['tickets'][0]['schedule']['toAirport']['code'],
        departureTime: json['tickets'][0]['schedule']['departure_time'],
        arrivalTime: json['tickets'][0]['schedule']['arrival_time'],
        travelType: (json['round_trip'] == true ? 'Round Trip' : 'One Way'),
        adultPass: json['adult'],
        childPass: json['child'],
        price: json['total_cost'],
        createdAt: json['createdAt']);
  }
}
