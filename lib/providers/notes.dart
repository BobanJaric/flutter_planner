import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/http_exception.dart';

import 'note.dart';

class Notes with ChangeNotifier {
  final String authToken;

  Notes(this.authToken, this._notes);

  List<Note> _notes = [];

  List<Note> get notes {
    return [..._notes];
  }

  var returnedNotes = [];
  Future<List> fetchAndSetNotes() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/getnotes/');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + authToken
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Note> loadedNotes = [];

      extractedData['notes'].forEach((noteData) {
        loadedNotes.add(Note(
          id: noteData['id'],
          date: noteData['date'],
          note: noteData['note'],
        ));
      });

      _notes = loadedNotes;
      /*   loadedNotes.forEach((element) {
        returnedNotes.add([element.note, element.date]);
      }); */

      /*  notifyListeners(); */
      return loadedNotes;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
