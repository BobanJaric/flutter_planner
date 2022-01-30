import 'package:flutter/foundation.dart';

class Note with ChangeNotifier {
  final String id;
  final String date;
  final String note;

  Note({
    this.id,
    this.date,
    this.note,
  });
}
