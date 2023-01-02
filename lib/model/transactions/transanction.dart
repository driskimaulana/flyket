import 'package:flyket/model/transactions/passanger.dart';

class Transaction {
  final int userId;
  final List<int> scheduleId;
  final int adult;
  final int child;
  final bool roundTrip;
  final List<Map<String, Map<String, String>>> biodataList;

  Map toJson() => {
        "user_id": userId,
        "schedule_id": scheduleId,
        "adult": adult,
        "child": child,
        "round_trip": roundTrip,
        "biodataList": biodataList,
      };

  Transaction(this.userId, this.scheduleId, this.adult, this.child,
      this.roundTrip, this.biodataList);
}
