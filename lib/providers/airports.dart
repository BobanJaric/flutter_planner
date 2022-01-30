import 'dart:convert';

import 'package:flutter/material.dart';
import './airport.dart';
import 'package:http/http.dart' as http;

class Airports with ChangeNotifier {
  /* final String authToken;

  Airports(this.authToken); */

  static Future<List> fetchAndSetAirports(apt, authToken) async {
    final url = Uri.parse('http://10.0.2.2:5000/api/flights/airport/${apt}');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Airport> loadedAirport = [];

      if (extractedData['airport'] != null) {
        loadedAirport.add(Airport(
          id: extractedData['airport'][1]['id'],
          icao: extractedData['airport'][1]['icao'],
          iata: extractedData['airport'][1]['iata'],
          country: extractedData['airport'][1]['country'],
          city: extractedData['airport'][1]['city'],
          hendler1: extractedData['airport'][1]['hendler1'],
          hendler2: extractedData['airport'][1]['hendler2'],
          hendler3: extractedData['airport'][1]['hendler3'],
          hendler4: extractedData['airport'][1]['hendler4'],
          note: extractedData['airport'][1]['note'],
          utc: extractedData['airport'][1]['utc'],
          vip: extractedData['airport'][1]['vip'],
          doz: extractedData['airport'][1]['doz'],
          slot: extractedData['airport'][1]['slot'],
          latitude: extractedData['airport'][1]['latitude'],
          longitude: extractedData['airport'][1]['longitude'],
          permit: extractedData['airport'][0]['permit'],
          contact: extractedData['airport'][0]['contact'],
          workingHours: extractedData['airport'][0]['workingHours'],
          leadingTime: extractedData['airport'][0]['leadingTime'],
          validity: extractedData['airport'][0]['validity'],
          noteCaa: extractedData['airport'][0]['note'],
        ));
      }

      return loadedAirport;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
