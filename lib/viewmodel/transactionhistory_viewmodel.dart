import 'package:flutter/cupertino.dart';
import 'package:flyket/model/apis/transaction_history.dart';
import 'package:flyket/model/services/web_services.dart';

class TransactionHistoryListViewModel extends ChangeNotifier {
  List<TransactionHistoryViewModel> transactions =
      <TransactionHistoryViewModel>[];

  Future<List<TransactionHistory?>> getAllTransaction() {
    return WebServices().getAllTransactions();
  }
}

class TransactionHistoryViewModel {
  final TransactionHistory transactionHistory;

  TransactionHistoryViewModel(this.transactionHistory);

  int get id {
    return this.transactionHistory.id;
  }

  String get flightNo {
    return this.transactionHistory.flightNo;
  }

  String get invoiceNumber {
    return this.transactionHistory.invoiceNumber;
  }

  String get transactionTime {
    return this.transactionHistory.transactionTime;
  }

  String get fromAirportName {
    return this.transactionHistory.fromAirportName;
  }

  String get fromAirportCode {
    return this.transactionHistory.fromAirportCode;
  }

  String get toAirportName {
    return this.transactionHistory.toAirportName;
  }

  String get toAirportCode {
    return this.transactionHistory.toAirportCode;
  }

  String get departureTime {
    return this.transactionHistory.departureTime;
  }

  String get arrivalTime {
    return this.transactionHistory.arrivalTime;
  }

  String get travelType {
    return this.transactionHistory.travelType;
  }

  int get adultPass {
    return this.transactionHistory.adultPass;
  }

  int get childPass {
    return this.transactionHistory.childPass;
  }

  int get price {
    return this.transactionHistory.price;
  }

  String get createdAt {
    return this.transactionHistory.createdAt;
  }
}
