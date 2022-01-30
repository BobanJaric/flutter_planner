import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../screens/flight_detail_screen.dart';
import '../providers/flight.dart';
import '../providers/auth.dart';

class ProductItem extends StatefulWidget {
  final String registration;

  // final String title;
  // final String imageUrl;

  ProductItem(this.registration);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  double isOneLeg = 0;
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Flight>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    var pax1 = product.paxnbr1 == '0' ? '/' : product.paxnbr1 + 'pax';
    var pax2 = product.paxnbr2 == '0' ? '/' : product.paxnbr2 + 'pax';
    var pax3 = product.paxnbr3 == '0' ? '/' : product.paxnbr3 + 'pax';
    var pax4 = product.paxnbr4 == '0' ? '/' : product.paxnbr4 + 'pax';

    if (product.arrivalTime2 == '' &&
        product.arrivalTime3 == '' &&
        product.arrivalTime4 == '') {
      setState(() {
        isOneLeg = 29.0;
      });
    } else if (product.arrivalTime3 == '' && product.arrivalTime4 == '') {
      isOneLeg = 20.0;
    } else if (product.arrivalTime4 == '') {
      isOneLeg = 11.0;
    } else {
      isOneLeg = 0;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: GridTile(
        child: Card(
          color: Colors.black,
          elevation: 10,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(5.0),
                ),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product.id,
                  );
                },
                child: Container(
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: FittedBox(
                                child: Text(
                                  widget.registration,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: isOneLeg),
                                  child: product.departureTime1 != ''
                                      ? Text(
                                          product.departureTime1 +
                                              ' ' +
                                              product.originIcao1 +
                                              '-' +
                                              product.destinationIcao1 +
                                              ' ' +
                                              product.arrivalTime1 +
                                              ' ' +
                                              pax1,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : SizedBox(
                                          height: 1,
                                        ),
                                ),
                                product.departureTime2 != ''
                                    ? Text(
                                        product.departureTime2 +
                                            ' ' +
                                            product.originIcao2 +
                                            '-' +
                                            product.destinationIcao2 +
                                            ' ' +
                                            product.arrivalTime2 +
                                            ' ' +
                                            pax2,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                                product.departureTime3 != ''
                                    ? Text(
                                        product.departureTime3 +
                                            ' ' +
                                            product.originIcao3 +
                                            '-' +
                                            product.destinationIcao3 +
                                            ' ' +
                                            product.arrivalTime3 +
                                            ' ' +
                                            pax3,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                                product.departureTime4 != ''
                                    ? Text(
                                        product.departureTime4 +
                                            ' ' +
                                            product.originIcao4 +
                                            '-' +
                                            product.destinationIcao4 +
                                            ' ' +
                                            product.arrivalTime4 +
                                            ' ' +
                                            pax4,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 1,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
