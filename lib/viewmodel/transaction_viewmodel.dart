import 'package:flyket/model/services/web_services.dart';
import 'package:flyket/model/transactions/transanction.dart';

class TransactionViewModel {
  bool isSuccess = false;

  Future<bool> createTransaction(Transaction transaction, String token) async {
    final results = await WebServices().createTransaction(transaction, token);
    return results;
  }
}
