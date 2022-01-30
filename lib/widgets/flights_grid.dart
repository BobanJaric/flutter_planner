import 'package:flutter/material.dart';
import '../providers/notes.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/flights.dart';
import 'flight_item.dart';

class ProductsGrid extends StatelessWidget {
  final DateTime currentDate;

  ProductsGrid(this.currentDate);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Flights>(context);
    final notesData = Provider.of<Notes>(context);

    final products = productsData.items
        .where((el) => el.date1 == DateFormat('yyyy-MM-dd').format(currentDate))
        .toList();

    final notes = notesData.notes
        .where((el) => el.date == DateFormat('yyyy-MM-dd').format(currentDate))
        .toList();
    var note = '';
    notes.forEach((element) {
      note = element.note;
    });

    final products1 = [...products];
    products1.forEach((el) {
      if (el.registration == 'YUSVL') {
        el.sort = 1;
      } else if (el.registration == 'YUSPC') {
        el.sort = 2;
      } else if (el.registration == 'YUSVJ') {
        el.sort = 3;
      } else if (el.registration == 'YUSCJ') {
        el.sort = 4;
      }
    });

    products1.sort((a, b) => a.sort.compareTo(b.sort));

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products1.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        /* create: (c) => products[i], */
        value: products1[i],
        child: ProductItem(products1[i].registration),
      ),
    );
  }
}
