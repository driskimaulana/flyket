import 'package:flyket/model/schedule/schedule.dart';
import 'package:flyket/model/services/web_services.dart';

class ScheduleListViewModel {
  List<ScheduleViewModel> schedules = <ScheduleViewModel>[];

  Future<List<ScheduleViewModel>> fetchScheduleList(String departureTime,
      int from_airport, int to_airport, int adult, String token) async {
    final results = await WebServices().fetchScheduleList(
        departureTime, from_airport, to_airport, adult, token);
    schedules = results.map((e) => ScheduleViewModel(e)).toList();
    return schedules;
  }
}

class ScheduleViewModel {
  final Schedule schedule;

  ScheduleViewModel(this.schedule);

  int get id {
    return this.schedule.id;
  }

  int get flightId {
    return this.schedule.flight_id;
  }

  int get fromAirport {
    return schedule.from_airport;
  }

  int get toAirport {
    return schedule.to_airport;
  }

  int get passanger {
    return schedule.passanger;
  }

  int get capacity {
    return schedule.capacity;
  }

  int get currentAirport {
    return schedule.current_airport;
  }

  int get cost {
    return schedule.cost;
  }

  String get departureTime {
    return schedule.departure_time;
  }

  String get arrivalTime {
    return schedule.arrival_time;
  }

  String get code {
    return schedule.code;
  }

  String get fClass {
    return schedule.fClass;
  }
}
