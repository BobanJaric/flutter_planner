import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/flights.dart';
import '../widgets/user_flight_item.dart';
import '../widgets/app_drawer.dart';
import 'edit_flight_screen.dart';

class UserProductsScreen extends StatefulWidget {
  static const routeName = '/user-products';

  @override
  State<UserProductsScreen> createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Flights>(context, listen: false).fetchAndSetFlights();
  }

  var reg = '';

  @override
  Widget build(BuildContext context) {
    /*    final productsData2 = Provider.of<Products>(context); */

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
        title: const Text('Your Flights'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              hint: Text(
                'Select Reg',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              items: <String>['YUSVL', 'YUSPC', 'YUSVJ', 'YUSCJ'].map(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Column(
                      children: [
                        Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  reg = value;
                });
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black,
        child: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: Consumer<Flights>(
                    builder: (ctx, productsData, _) => Padding(
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        itemCount: reg == ''
                            ? productsData.items.length
                            : productsData.items
                                .where((el) => el.registration == reg)
                                .toList()
                                .length,
                        itemBuilder: (_, i) => Column(
                          children: [
                            UserProductItem(
                                reg == ''
                                    ? productsData.items[i].id
                                    : [
                                        ...productsData.items
                                            .where(
                                                (el) => el.registration == reg)
                                            .toList()
                                      ][i]
                                        .id,
                                reg == ''
                                    ? productsData.items[i].registration
                                    : [
                                        ...productsData.items.where((el) {
                                          return el.registration == reg;
                                        }).toList()
                                      ][i]
                                        .registration,
                                reg == ''
                                    ? productsData.items[i].date1
                                    : [
                                        ...productsData.items
                                            .where(
                                                (el) => el.registration == reg)
                                            .toList()
                                      ][i]
                                        .date1,
                                productsData.paxRoute(reg == ''
                                    ? productsData.items[i]
                                    : [
                                        ...productsData.items
                                            .where(
                                                (el) => el.registration == reg)
                                            .toList()
                                      ][i])
                                /*   productsData.items[i].registration,
                                    productsData.items[i].date1 */
                                /* DateFormat('dd.MM')
                                      .format(productsData.items[i].date1), */
                                ),
                            Divider(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
