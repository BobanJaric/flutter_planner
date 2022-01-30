import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/flights.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  static String getCity(airports, icao) {
    var dataCity = '';
    if (airports.length != 0) {
      final data1 = airports.firstWhere((prod) => prod['icao'] == icao);
      dataCity = data1['city'].split(' ')[0];
    }
    return dataCity;
  }

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!

    final loadedProduct = Provider.of<Flights>(
      context,
      listen: false,
    ).findById(productId);
    var hndNew = loadedProduct.hnd;
    if (loadedProduct.hnd.length == 0) {
      hndNew = ['', '', '', '', '', '', '', ''];
    }
    if (loadedProduct.hnd.length == 6) {
      hndNew.addAll(['', '']);
    }
    if (loadedProduct.hnd.length == 4) {
      hndNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.hnd.length == 2) {
      hndNew.addAll(['', '', '', '']);
    }
    var slotNew = loadedProduct.slot;
    if (loadedProduct.slot.length == 0) {
      slotNew = ['', '', '', '', '', '', '', ''];
    }
    if (loadedProduct.slot.length == 6) {
      slotNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.slot.length == 4) {
      slotNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.slot.length == 2) {
      slotNew.addAll(['', '', '', '']);
    }

    var dozNew = loadedProduct.doz;
    if (loadedProduct.doz.length == 0) {
      dozNew = ['', '', '', '', '', '', '', ''];
    }
    if (loadedProduct.doz.length == 6) {
      dozNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.doz.length == 4) {
      dozNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.doz.length == 2) {
      dozNew.addAll(['', '', '', '']);
    }

    var ovfNew = loadedProduct.ovf;
    if (loadedProduct.ovf.length == 0) {
      ovfNew = ['', '', '', '', '', '', '', ''];
    }
    if (loadedProduct.ovf.length == 6) {
      ovfNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.ovf.length == 4) {
      ovfNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.ovf.length == 2) {
      ovfNew.addAll(['', '', '', '']);
    }

    var vipNew = loadedProduct.vip;
    if (loadedProduct.vip.length == 0) {
      vipNew = ['', '', '', '', '', '', '', ''];
    }
    if (loadedProduct.vip.length == 6) {
      vipNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.vip.length == 4) {
      vipNew.addAll(['', '', '', '']);
    }
    if (loadedProduct.vip.length == 2) {
      vipNew.addAll(['', '', '', '']);
    }
    print(loadedProduct.airportsData);
    print(getCity(loadedProduct.airportsData, loadedProduct.originIcao1));

    final list = [
      {
        'etd': loadedProduct.departureTime1,
        'origin': loadedProduct.originIcao1,
        'dest': loadedProduct.destinationIcao1,
        'eta': loadedProduct.arrivalTime1,
        'paxnbr': loadedProduct.paxnbr1,
        'hnd1': hndNew[0],
        'hnd2': hndNew[1],
        'slot1': slotNew[0],
        'slot2': slotNew[1],
        'doz1': dozNew[0],
        'doz2': dozNew[1],
        'ovf': ovfNew[0],
        'vip1': vipNew[0],
        'vip2': vipNew[1],
        'noteOps':
            loadedProduct.noteOps.length != 0 ? loadedProduct.noteOps[0] : '',
        'hndOrigin': loadedProduct.hendlerOrigin,
        'hndDest': loadedProduct.hendlerDestination1,
      },
      {
        'etd': loadedProduct.departureTime2,
        'origin': loadedProduct.originIcao2,
        'dest': loadedProduct.destinationIcao2,
        'eta': loadedProduct.arrivalTime2,
        'paxnbr': loadedProduct.paxnbr2,
        'hnd1': hndNew[2],
        'hnd2': hndNew[3],
        'slot1': slotNew[2],
        'slot2': slotNew[3],
        'doz1': dozNew[2],
        'doz2': dozNew[3],
        'ovf': ovfNew[2],
        'vip1': vipNew[2],
        'vip2': vipNew[3],
        'noteOps':
            loadedProduct.noteOps.length != 0 ? loadedProduct.noteOps[1] : '',
        'hndOrigin': loadedProduct.hendlerOrigin1,
        'hndDest': loadedProduct.hendlerDestination2,
      },
      {
        'etd': loadedProduct.departureTime3,
        'origin': loadedProduct.originIcao3,
        'dest': loadedProduct.destinationIcao3,
        'eta': loadedProduct.arrivalTime3,
        'paxnbr': loadedProduct.paxnbr3,
        'hnd1': hndNew[4],
        'hnd2': hndNew[5],
        'slot1': slotNew[4],
        'slot2': slotNew[5],
        'doz1': dozNew[4],
        'doz2': dozNew[5],
        'ovf': ovfNew[4],
        'vip1': vipNew[4],
        'vip2': vipNew[5],
        'noteOps':
            loadedProduct.noteOps.length != 0 ? loadedProduct.noteOps[2] : '',
        'hndOrigin': loadedProduct.hendlerOrigin2,
        'hndDest': loadedProduct.hendlerDestination3,
      },
      {
        'etd': loadedProduct.departureTime4,
        'origin': loadedProduct.originIcao4,
        'dest': loadedProduct.destinationIcao4,
        'eta': loadedProduct.arrivalTime4,
        'paxnbr': loadedProduct.paxnbr4,
        'hnd1': hndNew[6],
        'hnd2': hndNew[7],
        'slot1': slotNew[6],
        'slot2': slotNew[7],
        'doz1': dozNew[6],
        'doz2': dozNew[7],
        'ovf': ovfNew[6],
        'vip1': vipNew[6],
        'vip2': vipNew[7],
        'noteOps':
            loadedProduct.noteOps.length != 0 ? loadedProduct.noteOps[3] : '',
        'hndOrigin': loadedProduct.hendlerOrigin3,
        'hndDest': loadedProduct.hendlerDestination4,
      },
    ];

    if (loadedProduct.arrivalTime4 == '') {
      list.removeLast();
    }
    if (loadedProduct.arrivalTime3 == '') {
      list.removeAt(2);
    }
    if (loadedProduct.arrivalTime2 == '') {
      list.removeAt(1);
    }
    var foName = 'TBA';
    if (loadedProduct.crew[1] != '' && loadedProduct.crew[1] != null) {
      foName = loadedProduct.crew[1].toString().split(' ')[1];
    }
    var faName = 'TBA';
    if (loadedProduct.crew[2] != '' && loadedProduct.crew[2] != null) {
      faName = loadedProduct.crew[2].toString().split(' ')[1];
    }
    var captName = 'TBA';
    if (loadedProduct.crew[0] != '' && loadedProduct.crew[0] != null) {
      captName = loadedProduct.crew[0].toString().split(' ')[1];
    }

/*     if (loadedProduct.crew.length != 0) {
      captName = (loadedProduct.crew[0].split(' ')[0])[0] +
          (loadedProduct.crew[0].split(' ')[1])[0];
      foName = (loadedProduct.crew[1].split(' ')[0])[0] +
          (loadedProduct.crew[1].split(' ')[1])[0];
      faName = (loadedProduct.crew[2].split(' ')[0])[0] +
          (loadedProduct.crew[2].split(' ')[1])[0];
    }
    ; */

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          loadedProduct.registration,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.red, Colors.blue],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Column(
                children: [
                  for (var item in list)
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 110,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        item['etd'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'DEP',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        item['eta'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        'ARR',
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        item['origin'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        getCity(loadedProduct.airportsData,
                                            item['origin']),
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        item['dest'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        getCity(loadedProduct.airportsData,
                                            item['dest']),
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'PAX Nbr',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        item['paxnbr'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              //hnd
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            color: item['hnd1'] == 'green'
                                                ? Colors.green
                                                : Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'H',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            color: item['hnd2'] == 'green'
                                                ? Colors.green
                                                : Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'H',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //slot
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        item['slot1'] != null &&
                                                item['slot1'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  color: item['slot1'] ==
                                                          'green'
                                                      ? Colors.green
                                                      : item['slot1'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'S',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        item['slot2'] != null &&
                                                item['slot2'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  color: item['slot2'] ==
                                                          'green'
                                                      ? Colors.green
                                                      : item['slot2'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'S',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //dozvola
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        item['doz1'] != null &&
                                                item['doz1'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  color: item['doz1'] == 'green'
                                                      ? Colors.green
                                                      : item['doz1'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'D',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        item['doz2'] != null &&
                                                item['doz2'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  color: item['doz2'] == 'green'
                                                      ? Colors.green
                                                      : item['doz2'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'D',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //ovf
                              item['ovf'] != null && item['ovf'] != ''
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              item['ovf'] != null
                                                  ? Container(
                                                      height: 30,
                                                      width: 18,
                                                      decoration: BoxDecoration(
                                                        color: item['ovf'] ==
                                                                'green'
                                                            ? Colors.green
                                                            : item['ovf'] ==
                                                                    'red'
                                                                ? Colors.red
                                                                : Colors
                                                                    .transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Center(
                                                        child: RotatedBox(
                                                          quarterTurns: 3,
                                                          child: Text(
                                                            'OVF',
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      height: 18,
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),

                              //vip
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 15),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        item['vip1'] != null &&
                                                item['vip1'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: item['vip1'] == 'green'
                                                      ? Colors.green
                                                      : item['vip1'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'VIP',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        item['vip2'] != null &&
                                                item['vip2'] != ''
                                            ? Container(
                                                height: 18,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: item['vip2'] == 'green'
                                                      ? Colors.green
                                                      : item['vip2'] == 'red'
                                                          ? Colors.red
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'VIP',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 18,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    Wrap(children: <Widget>[
                                      Text('Note:  '),
                                      Text(
                                        item['noteOps'] == '' ||
                                                item['noteOps'] == null
                                            ? 'No notes'
                                            : item['noteOps'],
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3, bottom: 3),
                        child: Column(
                          children: [
                            Wrap(children: <Widget>[
                              Column(children: [
                                Text('Captain'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(captName),
                              ]),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text('First Officer'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(foName)
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text('Flight Attendant'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    faName,
                                  ),
                                ],
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Container(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Note: ' + loadedProduct.note)),
                    ),
                  ),
                ),
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 14),
              child: Container(
                alignment: Alignment.centerLeft,
                /*  width: double.infinity, */
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Handling',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(
                                      context,
                                      loadedProduct.hendlerOrigin,
                                    ),
                                  );
                                },
                                child: Text(
                                  loadedProduct.originIcao1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Row(
                                children: [
                                  for (var item in list)
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopupDialog(
                                            context,
                                            item['hndDest'],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        item['dest'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String prod) {
  print(prod);
  return new AlertDialog(
    backgroundColor: Colors.black,
    title: const Text(
      'Handler',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          prod,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
