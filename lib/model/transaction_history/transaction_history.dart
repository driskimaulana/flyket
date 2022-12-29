import 'dart:convert';
import 'package:http/http.dart' as http;

class TransactionHistoryObj {
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

  TransactionHistoryObj(
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

  factory TransactionHistoryObj.createTransactionHistory(
      Map<String, dynamic> json) {
    return TransactionHistoryObj(
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

  static Future<List<TransactionHistoryObj>> getTransactions() async {
    String apiURL = "https://flytick-dev.up.railway.app/api/transaction";

    var response = await http.get(Uri.parse(apiURL), headers: {
      'Authorization':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IlNla2FyIE1LIiwiZW1haWwiOiJzZWthcm1hZHVrdXN1bWF3YXJkYW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEhNemhkbDNYNTZLZVY4d1Zaa2JNd3VFU1hqMXlCYWhqSk8zVFRCSW5idjBDYTY2QXVNTmJPIiwiYXZhdGFyX2lkIjoxLCJyb2xlIjoic3VwZXJhZG1pbiIsImJhbGFuY2UiOjEwMDAwMDAwLCJiaW9kYXRhX2lkIjoxLCJsb2dpbl90eXBlIjoiYmFzaWMiLCJpYXQiOjE2NzA4MzAwMTF9.vzjAE1wpAIs8EHiALns_T3yyX9wX2eKczu7ab-bsa5k"
    });
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listTransaction =
          (jsonObject as Map<String, dynamic>)['data'];

      List<TransactionHistoryObj> transactions = [];
      for (int i = 0; i < listTransaction.length; i++) {
        transactions.add(
            TransactionHistoryObj.createTransactionHistory(listTransaction[i]));
      }

      return transactions;
    } else {
      throw response.statusCode;
    }
  }
}
