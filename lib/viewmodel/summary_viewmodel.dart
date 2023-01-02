import 'package:flyket/model/apis/summary.dart';
import 'package:flyket/model/services/web_services.dart';

class SummaryListViewModel {
  late List<Summary> summaries;

  Future<List<Summary>> fetchSummary(String token) async {
    summaries = await WebServices().fetchSummary(token);
    return summaries;
  }
}
