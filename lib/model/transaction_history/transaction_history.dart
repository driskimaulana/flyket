import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  List tickets;
  dynamic user;

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
      required this.createdAt,
      required this.tickets,
      required this.user});

  factory TransactionHistoryObj.fromJson(Map<String, dynamic> json) {
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
        createdAt: json['createdAt'],
        tickets: json['tickets'],
        user: json['user']);
  }

  static Future<List<TransactionHistoryObj>> getAllTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? '';

    String apiURL = "https://flytick-dev.up.railway.app/api/transaction";

    var response =
        await http.get(Uri.parse(apiURL), headers: {'Authorization': token});
    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      List<dynamic> listTransaction =
          (jsonObject as Map<String, dynamic>)['data'];

      List<TransactionHistoryObj> transactions = [];
      for (int i = 0; i < listTransaction.length; i++) {
        transactions.add(TransactionHistoryObj.fromJson(listTransaction[i]));
      }

      return transactions;
    } else {
      throw response.statusCode;
    }
  }

  static Future<TransactionHistoryObj> getTransactionDetail(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString("token") ?? '';

    String apiURL = "https://flytick-dev.up.railway.app/api/transaction/${id}";

    var response =
        await http.get(Uri.parse(apiURL), headers: {'Authorization': token});

    if (response.statusCode == 200) {
      var jsonObject = json.decode(response.body);
      var transaction = (jsonObject as Map<String, dynamic>)['data'];
      return TransactionHistoryObj.fromJson(transaction);
    } else {
      throw response.statusCode;
    }
  }
}
