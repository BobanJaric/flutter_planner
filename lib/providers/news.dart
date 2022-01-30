import 'dart:convert';

import 'package:flutter/material.dart';
import './new.dart';
import 'package:http/http.dart' as http;

class News with ChangeNotifier {
  static Future<List> fetchAndSetNews(authToken) async {
    var code = 'rs';
    final url = Uri.parse('http://10.0.2.2:5000/api/news/');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<New> loadedNews = [];

      extractedData['news'].forEach((prodData) {
        countries.forEach((el) {
          if (el['name'] == prodData['country']) {
            code = el['code'];
          }
        });
        print(code);
        final dateCorr =
            (prodData['created_at'].toString().substring(0, 10).split('-'));
        loadedNews.add(New(
            info: prodData['info'],
            headline: prodData['headline'],
            country: prodData['country'] == null ? '' : prodData['country'],
            city: prodData['city'] == null ? '' : prodData['city'],
            category: prodData['category'],
            date: dateCorr[2] + '.' + dateCorr[1] + '.' + dateCorr[0],
            code: code.toLowerCase()));
      });
      loadedNews.sort((a, b) => b.date.compareTo(a.date));
      return loadedNews;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

List countries = [
  {"name": "Afghanistan", "code": "AF"},
  {"name": "Albania", "code": "AL"},
  {"name": "Algeria", "code": "DZ"},
  {"name": "Armenia", "code": "AM"},
  {"name": "Austria", "code": "AT"},
  {"name": "Azerbaijan", "code": "AZ"},
  {"name": "Bahrain", "code": "BH"},
  {"name": "Belarus", "code": "BY"},
  {"name": "Belgium", "code": "BE"},
  {"name": "Bosnia and Herzegovina", "code": "BA"},
  {"name": "Bulgaria", "code": "BG"},
  {"name": "Croatia", "code": "HR"},
  {"name": "Cyprus", "code": "CY"},
  {"name": "Czech Republic", "code": "CZ"},
  {"name": "Denmark", "code": "DK"},
  {"name": "Egypt", "code": "EG"},
  {"name": "Estonia", "code": "EE"},
  {"name": "Finland", "code": "FI"},
  {"name": "France", "code": "FR"},
  {"name": "Georgia", "code": "GE"},
  {"name": "Germany", "code": "DE"},
  {"name": "Ghana", "code": "GH"},
  {"name": "Gibraltar", "code": "GI"},
  {"name": "Greece", "code": "GR"},
  {"name": "Hungary", "code": "HU"},
  {"name": "Iceland", "code": "IS"},
  {"name": "India", "code": "IN"},
  {"name": "Iran", "code": "IR"},
  {"name": "Iraq", "code": "IQ"},
  {"name": "Ireland", "code": "IE"},
  {"name": "Isle of Man", "code": "IM"},
  {"name": "Israel", "code": "IL"},
  {"name": "Italy", "code": "IT"},
  {"name": "Japan", "code": "JP"},
  {"name": "Jersey", "code": "JE"},
  {"name": "Jordan", "code": "JO"},
  {"name": "Kazakhstan", "code": "KZ"},
  {"name": "Kuwait", "code": "KW"},
  {"name": "Kyrgyzstan", "code": "KG"},
  {"name": "Latvia", "code": "LV"},
  {"name": "Lebanon", "code": "LB"},
  {"name": "Liechtenstein", "code": "LI"},
  {"name": "Lithuania", "code": "LT"},
  {"name": "Luxembourg", "code": "LU"},
  {"name": "Macedonia", "code": "MK"},
  {"name": "Maldives", "code": "MV"},
  {"name": "Malta", "code": "MT"},
  {"name": "Mexico", "code": "MX"},
  {"name": "Moldova", "code": "MD"},
  {"name": "Montenegro", "code": "me"},
  {"name": "Morocco", "code": "MA"},
  {"name": "Netherlands", "code": "NL"},
  {"name": "Norway", "code": "NO"},
  {"name": "Oman", "code": "OM"},
  {"name": "Poland", "code": "PL"},
  {"name": "Portugal", "code": "PT"},
  {"name": "Qatar", "code": "QA"},
  {"name": "Romania", "code": "RO"},
  {"name": "Russia", "code": "RU"},
  {"name": "Saudi Arabia", "code": "SA"},
  {"name": "Serbia", "code": "rs"},
  {"name": "Slovakia", "code": "sk"},
  {"name": "Slovenia", "code": "si"},
  {"name": "Spain", "code": "ES"},
  {"name": "Sweden", "code": "SE"},
  {"name": "Switzerland", "code": "CH"},
  {"name": "Tunisia", "code": "TN"},
  {"name": "Turkey", "code": "TR"},
  {"name": "Turkmenistan", "code": "TM"},
  {"name": "Ukraine", "code": "UA"},
  {"name": "United Arab Emirates", "code": "AE"},
  {"name": "United Kingdom", "code": "GB"},
  {"name": "United States", "code": "US"},
  {"name": "Uzbekistan", "code": "UZ"},
];
