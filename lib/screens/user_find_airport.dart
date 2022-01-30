import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/colors.dart';
import '../widgets/app_drawer.dart';
import '../providers/airports.dart';
import '../providers/airport.dart';

import '../widgets/search_widget.dart';

class AirportFindScreen extends StatefulWidget {
  static const routeName = '/user-airports';
  final authToken;

  AirportFindScreen(this.authToken);

  @override
  _AirportFindScreenState createState() =>
      _AirportFindScreenState(this.authToken);
}

class _AirportFindScreenState extends State<AirportFindScreen> {
  final authToken;
  var airports;
  String query = '';

  _AirportFindScreenState(this.authToken);

  @override
  void initState() {
    super.initState();
  }

  /* var allApts;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Airports>(context).fetchAndSetAirports(query).then((value) {
        _isLoading = false;
        allApts = value;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  } */

/*   final allApts = <Airport>[
    Airport(
        id: "6028e9df88890535f019d78a",
        icao: "LTFM",
        iata: "IST",
        country: "Turkey",
        city: "Istanbul",
        hendler1:
            "GozenAir, + 90 534 592 11 74,  OCC@gozenair.com; ist@gozenair.com",
        hendler2: " ",
        hendler3: " ",
        hendler: " ",
        note: " ",
        utc: "3",
        vip: "yes",
        doz: "yes",
        slot: "yes",
        latitude: "28.741951",
        longitude: "41.261297"),
    Airport(
        id: "6028ea7e88890535f019d78b",
        icao: "LIEO",
        iata: "OLB",
        country: "Italy",
        city: "Olbia",
        hendler1: "Eccelsa Aviation,+39 0789 563 480, handling@eccelsa.com",
        hendler2: " ",
        hendler3: " ",
        hendler: " ",
        note: " ",
        utc: "3",
        vip: "yes",
        doz: "yes",
        slot: "yes",
        latitude: "9.51763",
        longitude: "40.898701"),
    Airport(
        id: "603131a9d4ed23146c8aaecd",
        icao: "EDDM",
        iata: "MUC",
        country: "Germany",
        city: "Munich",
        hendler1: "MAS, +49 89 973 379 220, masops@germanaviation.com",
        hendler2: " ",
        hendler3: " ",
        hendler: " ",
        note: " ",
        utc: "2",
        vip: "yes",
        doz: "yes",
        slot: "yes",
        latitude: "11.7861",
        longitude: "48.353802")
  ];
 */
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.92;
    print(airports);
    return Scaffold(
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
        title: const Text('Find Airport'),
      ),
      drawer: AppDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          color: AppColor.darkBackground,
          child: Column(
            children: <Widget>[
              buildSerach(),
              airports != null && airports != []
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: airports != null ? airports.length : 0,
                          itemBuilder: (context, index) {
                            final airport = airports[index];
                            return buildAirport(airport);
                          }),
                    )
                  : Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.flight_takeoff,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.trending_flat,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.flight_land,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Search Airports',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[Colors.red, Colors.blue],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSerach() => SearchWidget(
        text: query,
        hintText: 'Enter 4 letter ICAO code',
        onChanged: searchAirport,
      );

  /* Widget buildAirport(Airport airport) => ListTile(
        leading: Text(airport.icao),
        title: Text(airport.city),
        subtitle: Text(airport.country),
        trailing: Text(airport.permit == null ? '' : airport.permit),
      ); */

  Widget buildAirport(Airport airport) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 16, color: Colors.white),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              /* color: Colors.white, */
              border: Border.all(color: Colors.black26),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.red, Colors.blue],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0, left: 4),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(airport.city),
                        Text(','),
                        SizedBox(
                          width: 2,
                        ),
                        Text(airport.icao),
                      ],
                    ),
                  ),
                  newMethod(airport.hendler1, 'HND1:'),
                  airport.hendler2 != ''
                      ? newMethod(airport.hendler2, 'HND2:')
                      : SizedBox(),
                  airport.hendler3 != ' ' && airport.hendler3 != ''
                      ? newMethod(airport.hendler3, 'HND3:')
                      : SizedBox(),
                  airport.hendler4 != ' ' && airport.hendler4 != ''
                      ? newMethod(airport.hendler4, 'HND4:')
                      : SizedBox(),
                  airport.note != '' && airport.note != ''
                      ? newMethod(airport.note, 'Note:')
                      : SizedBox(),
                  Divider(
                    color: Colors.white,
                    thickness: 1.4,
                  ),
                  airport.country != '' && airport.country != ''
                      ? newMethod(airport.country, 'Country:')
                      : SizedBox(),
                  airport.permit != '' && airport.permit != ''
                      ? newMethod(airport.permit, 'Permit:')
                      : SizedBox(),
                  airport.contact != '' && airport.contact != ''
                      ? newMethod(airport.contact, 'Contact:')
                      : SizedBox(),
                  airport.noteCaa != '' && airport.noteCaa != ''
                      ? newMethod(airport.noteCaa, 'Note:')
                      : SizedBox(),
                  airport.workingHours != '' && airport.workingHours != ''
                      ? newMethod(airport.workingHours, 'O.Hours:')
                      : SizedBox(),
                  airport.leadingTime != '' && airport.leadingTime != ''
                      ? newMethod(airport.leadingTime, 'L.Time:')
                      : SizedBox(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ));

  Padding newMethod(String airport, String name) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 10.0,
      ),
      child: Row(
        children: [
          ConstrainedBox(
            child: Text(name),
            constraints: BoxConstraints.tightFor(width: 85),
          ),
          Expanded(
            child: Text(
              airport,
              softWrap: false,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future searchAirport(String query) async {
    if (query.length < 4 && query.length > 0) {
      return;
    }
    if (query.length == 0) {
      setState(() {
        this.airports = [];
      });
    }
    final searchUpper = query.toUpperCase();
    final airports = await Airports.fetchAndSetAirports(searchUpper, authToken);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.airports = airports;
    });
  }
}

/* final airports = allApts.where((apt) {
      final icaoCode = apt.icao;
      final cityName = apt.city;
      final searchUpper = query.toUpperCase();
      final searchCapitalize = query.toTitleCase();

      return icaoCode.contains(searchUpper) ||
          cityName.contains(searchCapitalize);
    }).toList(); */

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
