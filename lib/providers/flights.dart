// ignore_for_file: missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

import 'flight.dart';

class Flights with ChangeNotifier {
  List<Flight> _items = [];

  final String authToken;
  final String userId;

  Flights(this.authToken, this.userId, this._items);

  List<Flight> get items {
    return [..._items];
  }

  Flight findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  String paxRoute(Flight flt) {
    var route = '';
    if (flt.paxnbr1 != '0' && flt.paxnbr1 != '' && flt.paxnbr1 != null) {
      route = flt.originIcao1 + '-' + flt.destinationIcao1;
    }
    if (flt.paxnbr2 != '0' && flt.paxnbr2 != '' && flt.paxnbr2 != null) {
      route = flt.originIcao2 + '-' + flt.destinationIcao2;
    }
    if (flt.paxnbr1 != '0' &&
        flt.paxnbr2 != '0' &&
        flt.paxnbr1 != '' &&
        flt.paxnbr2 != '') {
      route = flt.originIcao1 +
          '-' +
          flt.destinationIcao1 +
          '-' +
          flt.destinationIcao2;
    }
    if (flt.paxnbr3 != '0' &&
        flt.paxnbr3 != '' &&
        flt.originIcao3 != null &&
        flt.destinationIcao3 != null) {
      route = flt.originIcao3 + '-' + flt.destinationIcao3;
    }
    if (flt.paxnbr3 != '0' &&
        flt.paxnbr3 != '' &&
        flt.paxnbr2 != '0' &&
        flt.paxnbr2 != '' &&
        flt.originIcao3 != null &&
        flt.destinationIcao3 != null) {
      route = flt.originIcao2 +
          '-' +
          flt.destinationIcao2 +
          '-' +
          flt.destinationIcao3;
    }

    if (flt.paxnbr3 != '0' &&
        flt.paxnbr3 != '' &&
        flt.paxnbr2 != '0' &&
        flt.paxnbr2 != '' &&
        flt.paxnbr1 != '0' &&
        flt.paxnbr1 != '' &&
        flt.originIcao3 != null &&
        flt.destinationIcao3 != null) {
      route = flt.originIcao1 +
          '-' +
          flt.originIcao2 +
          '-' +
          flt.destinationIcao2 +
          '-' +
          flt.destinationIcao3;
    }
    return route;
  }

  List<Flight> findReg(String reg) {
    return _items.where((prod) => prod.registration == reg);
  }

  Future<void> fetchAndSetFlights() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/flights/user/1');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Flight> loadedFlights = [];

      extractedData['flights'].forEach((prodData) {
        var crew2 = prodData['crew'];
        if (prodData['crew'].length == 0) {
          crew2 = ['tba tba', 'tba tba', 'tba tba'];
        }
        loadedFlights.add(Flight(
          id: prodData['id'],
          crew: crew2,
          registration: prodData['registration'],
          callsign: prodData['callsign'],
          broker1: prodData['broker1'],
          broker2: prodData['broker2'],
          broker3: prodData['broker3'],
          broker4: prodData['broker4'],
          note: prodData['note'],
          originIcao1: prodData['originIcao1'],
          originIcao2: prodData['originIcao2'],
          originIcao3: prodData['originIcao3'],
          originIcao4: prodData['originIcao4'],
          destinationIcao1: prodData['destinationIcao1'],
          destinationIcao2: prodData['destinationIcao2'],
          destinationIcao3: prodData['destinationIcao3'],
          destinationIcao4: prodData['destinationIcao4'],
          arrivalTime1: prodData['arrivalTime1'],
          arrivalTime2: prodData['arrivalTime2'],
          arrivalTime3: prodData['arrivalTime3'],
          arrivalTime4: prodData['arrivalTime4'],
          departureTime1: prodData['departureTime1'],
          departureTime2: prodData['departureTime2'],
          departureTime3: prodData['departureTime3'],
          departureTime4: prodData['departureTime4'],
          flightType1: prodData['flightType1'],
          flightType2: prodData['flightType2'],
          flightType3: prodData['flightType3'],
          flightType4: prodData['flightType4'],
          date1: prodData['date1'],
          date2: prodData['date2'],
          date3: prodData['date3'],
          date4: prodData['date4'],
          paxnbr1: prodData['paxnbr1'],
          paxnbr2: prodData['paxnbr2'],
          paxnbr3: prodData['paxnbr3'],
          paxnbr4: prodData['paxnbr4'],
          hendlerDestination1: prodData['hendlerDestination1'],
          hendlerDestination2: prodData['hendlerDestination2'],
          hendlerDestination3: prodData['hendlerDestination3'],
          hendlerDestination4: prodData['hendlerDestination4'],
          msp1: prodData['msp1'],
          msp2: prodData['msp2'],
          msp3: prodData['msp3'],
          msp4: prodData['msp4'],
          hendlerOrigin1: prodData['hendlerOrigin1'],
          hendlerOrigin2: prodData['hendlerOrigin2'],
          hendlerOrigin3: prodData['hendlerOrigin3'],
          hendlerOrigin: prodData['hendlerOrigin'],
          hnd: prodData['handling'],
          doz: prodData['doz'],
          slot: prodData['slot'],
          ovf: prodData['ovf'],
          vip: prodData['vip'],
          noteOps: prodData['noteOps'],
          airportsData: prodData['airportsData'],
        ));
        /* print(loadedFlights[0].hnd); */
      });

      _items = loadedFlights;

      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addFlight(Flight flight) async {
    final url = Uri.parse('http://10.0.2.2:5000/api/flights/mobapp/');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
        body: json.encode({
          'registration': flight.registration,
          'date1': flight.date1,
          'date2': flight.date2,
          'date3': flight.date3 == null ? '' : flight.date3,
          'date4': flight.date4 == null ? '' : flight.date4,
          'note': flight.note,
          'departureTime1': flight.departureTime1,
          'departureTime2': flight.departureTime2,
          'departureTime3':
              flight.departureTime3 == null ? '' : flight.departureTime3,
          'departureTime4':
              flight.departureTime4 == null ? '' : flight.departureTime4,
          'arrivalTime1': flight.arrivalTime1,
          'arrivalTime2': flight.arrivalTime2,
          'arrivalTime3':
              flight.arrivalTime3 == null ? '' : flight.arrivalTime3,
          'arrivalTime4':
              flight.arrivalTime4 == null ? '' : flight.arrivalTime4,
          'originIcao1': flight.originIcao1,
          'originIcao2': flight.originIcao2,
          'originIcao3': flight.originIcao3 == null ? '' : flight.originIcao3,
          'originIcao4': flight.originIcao4 == null ? '' : flight.originIcao4,
          'destinationIcao1': flight.destinationIcao1,
          'destinationIcao2': flight.destinationIcao2,
          'destinationIcao3':
              flight.destinationIcao3 == null ? '' : flight.destinationIcao3,
          'destinationIcao4':
              flight.destinationIcao4 == null ? '' : flight.destinationIcao4,
          'flightType1': flight.flightType1,
          'flightType2': flight.flightType2,
          'flightType3': flight.flightType3 == null ? '' : flight.flightType3,
          'flightType4': flight.flightType4 == null ? '' : flight.flightType4,
          'paxnbr1': flight.paxnbr1,
          'paxnbr2': flight.paxnbr2,
          'paxnbr3': flight.paxnbr3 == null ? '' : flight.paxnbr3,
          'paxnbr4': flight.paxnbr4 == null ? '' : flight.paxnbr4,
        }),
      );
      final newFlight = Flight(
        registration: flight.registration,
        date1: flight.date1,
        date2: '',
        date3: '',
        date4: '',
        note: flight.note,
        originIcao1: flight.originIcao1,
        originIcao2: '',
        originIcao3: '',
        originIcao4: '',
        destinationIcao1: flight.destinationIcao1,
        destinationIcao2: '',
        destinationIcao3: '',
        destinationIcao4: '',
        departureTime1: flight.departureTime1,
        departureTime2: '',
        departureTime3: '',
        departureTime4: '',
        arrivalTime1: flight.arrivalTime1,
        arrivalTime2: '',
        arrivalTime3: '',
        arrivalTime4: '',
        flightType1: flight.flightType1,
        flightType2: '',
        flightType3: '',
        flightType4: '',
        paxnbr1: flight.paxnbr1,
        paxnbr2: '',
        paxnbr3: '',
        paxnbr4: '',
        id: json.decode(response.body)['id'],
      );
      _items.add(newFlight);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Flight newFlight) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse('http://10.0.2.2:5000/api/flights/mobapp/$id');
      await http.patch(
        url,
        body: json.encode({
          'registration': newFlight.registration,
          'note': newFlight.note,
          'date1': newFlight.date1,
          'date2': newFlight.date2,
          'date3': newFlight.date3,
          'date4': newFlight.date4,
          'departureTime1': newFlight.departureTime1,
          'departureTime2': newFlight.departureTime2,
          'departureTime3': newFlight.departureTime3,
          'departureTime4': newFlight.departureTime4,
          'originIcao1': newFlight.originIcao1,
          'originIcao2': newFlight.originIcao2,
          'originIcao3': newFlight.originIcao3,
          'originIcao4': newFlight.originIcao4,
          'destinationIcao1': newFlight.destinationIcao1,
          'destinationIcao2': newFlight.destinationIcao2,
          'destinationIcao3': newFlight.destinationIcao3,
          'destinationIcao4': newFlight.destinationIcao4,
          'arrivalTime1': newFlight.arrivalTime1,
          'arrivalTime2': newFlight.arrivalTime2,
          'arrivalTime3': newFlight.arrivalTime3,
          'arrivalTime4': newFlight.arrivalTime4,
          'paxnbr1': newFlight.paxnbr1,
          'paxnbr2': newFlight.paxnbr2,
          'paxnbr3': newFlight.paxnbr3,
          'paxnbr4': newFlight.paxnbr4,
          'flightType1': newFlight.flightType1,
          'flightType2': newFlight.flightType2,
          'flightType3': newFlight.flightType3,
          'flightType4': newFlight.flightType4,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
      );
      _items[prodIndex] = newFlight;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteFlight(String id) async {
    print(id);
    final url = Uri.parse('http://10.0.2.2:5000/api/flights/$id');
    final existingFlightIndex = items.indexWhere((prod) => prod.id == id);
    var existingFlight = _items[existingFlightIndex];
    _items.removeAt(existingFlightIndex);
    notifyListeners();
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + authToken
      },
    );
    if (response.statusCode >= 400) {
      _items.insert(existingFlightIndex, existingFlight);
      notifyListeners();
      throw HttpException('Could not delete flt!');
    }
    existingFlight = null;
  }
}
