import 'package:flutter/material.dart';
import '../providers/note.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/flights_grid.dart';
import '../widgets/app_drawer.dart';
import '../providers/flights.dart';
import '../providers/notes.dart';

enum FilterOptions {
  Favorites,
  All,
}

class FlightsOverviewScreen extends StatefulWidget {
  @override
  _FlightsOverviewScreenState createState() => _FlightsOverviewScreenState();
}

class _FlightsOverviewScreenState extends State<FlightsOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;
  var notes;
  var note = '';

  DateTime currentDateInitial = DateTime.now();
  // var currentDate = DateFormat('yyyy-MM-dd').format(currentDateInitial);

  @override
  void initState() {
    /* Provider.of<Products>(context).fetchAndSetProducts(); Wont work !!! */
    /*  Future.delayed(Duration.zero).then((_) {
      Provider.of<Notes>(context).fetchAndSetNotes();
    });
 */
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Flights>(context).fetchAndSetFlights().then((_) {
        _isLoading = false;
      });
      Provider.of<Notes>(context).fetchAndSetNotes().then((value) {
        _isLoading = false;
        notes = value;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  _setCurentDateNext() {
    var nextDay = currentDateInitial.add(const Duration(days: 1));
    setState(() {
      currentDateInitial = nextDay;
    });
  }

  _setCurentDatePrev() {
    var prevDay = currentDateInitial.subtract(const Duration(days: 1));
    setState(() {
      currentDateInitial = prevDay;
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDateInitial, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != currentDateInitial)
      setState(() {
        currentDateInitial = picked;
      });
  }

  _getNote(date) {
    note = '';
    if (notes != null) {
      notes.forEach((val) {
        if (val.date == DateFormat('yyyy-MM-dd').format(date)) {
          note = val.note;
        }
      });
    }

    return note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.red, Colors.blue],
            ),
          ),
        ),
        title: Text('Date: ' +
            DateFormat('dd.MM').format(currentDateInitial).toString()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              _setCurentDatePrev();
            },
          ),
          IconButton(
            icon: const Icon(Icons.date_range_outlined),
            onPressed: () => _selectDate(context),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
              _setCurentDateNext();
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(currentDateInitial),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getNote(currentDateInitial),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
