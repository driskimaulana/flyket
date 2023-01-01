import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flyket/model/apis/airport.dart';
import 'package:flyket/model/services/web_services.dart';

class AirportListViewModel extends ChangeNotifier {
  List<AirportViewModel> airports = <AirportViewModel>[];

  Future<void> fetchAirports() async {
    final results = await WebServices().fetchAirportList();
    log("results: ${results[0]}");
    this.airports = results.map((e) => AirportViewModel(e)).toList();
    print(this.airports.length);
    notifyListeners();
  }
}

class AirportViewModel {
  final Airport airport;

  AirportViewModel(this.airport);

  int get id {
    return this.airport.id;
  }

  String get code {
    return this.airport.code;
  }

  String get name {
    return this.airport.name;
  }

  String get citi {
    return this.airport.city;
  }

  String get country {
    return this.airport.country;
  }
}
