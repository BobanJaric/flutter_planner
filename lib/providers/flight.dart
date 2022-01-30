import 'package:flutter/foundation.dart';

class Flight with ChangeNotifier {
  final String id;
  var sort;
  final String registration;
  final String callsign;
  final String note;
  final String originIcao1;
  final String originIcao2;
  final String originIcao3;
  final String originIcao4;
  final String destinationIcao1;
  final String destinationIcao2;
  final String destinationIcao3;
  final String destinationIcao4;
  final String arrivalTime1;
  final String arrivalTime2;
  final String arrivalTime3;
  final String arrivalTime4;
  final String departureTime1;
  final String departureTime2;
  final String departureTime3;
  final String departureTime4;
  final List crew;
  final List broker1;
  final List broker2;
  final List broker3;
  final List broker4;
  final String flightType1;
  final String flightType2;
  final String flightType3;
  final String flightType4;
  final String date1;
  final String date2;
  final String date3;
  final String date4;
  final String paxnbr1;
  final String paxnbr2;
  final String paxnbr3;
  final String paxnbr4;
  final String hendlerOrigin;
  final String hendlerOrigin1;
  final String hendlerOrigin2;
  final String hendlerOrigin3;
  final String hendlerDestination1;
  final String hendlerDestination2;
  final String hendlerDestination3;
  final String hendlerDestination4;
  final String msp1;
  final String msp2;
  final String msp3;
  final String msp4;
  final List hnd;
  final List slot;
  final List doz;
  final List vip;
  final List ovf;
  final List noteOps;
  final List airportsData;

  Flight({
    @required this.id,
    this.sort,
    @required this.registration,
    this.callsign,
    @required this.note,
    @required this.originIcao1,
    this.originIcao2,
    this.originIcao3,
    this.originIcao4,
    @required this.destinationIcao1,
    this.destinationIcao2,
    this.destinationIcao3,
    this.destinationIcao4,
    @required this.arrivalTime1,
    this.arrivalTime2,
    this.arrivalTime3,
    this.arrivalTime4,
    @required this.departureTime1,
    this.departureTime2,
    this.departureTime3,
    this.departureTime4,
    this.broker1,
    this.broker2,
    this.broker3,
    this.broker4,
    this.crew,
    @required this.flightType1,
    this.flightType2,
    this.flightType3,
    this.flightType4,
    @required this.date1,
    this.date2,
    this.date3,
    this.date4,
    @required this.paxnbr1,
    this.paxnbr2,
    this.paxnbr3,
    this.paxnbr4,
    this.hendlerOrigin,
    this.hendlerOrigin2,
    this.hendlerOrigin3,
    this.hendlerOrigin1,
    this.hendlerDestination1,
    this.hendlerDestination2,
    this.hendlerDestination3,
    this.hendlerDestination4,
    this.msp1,
    this.msp2,
    this.msp3,
    this.msp4,
    this.hnd,
    this.slot,
    this.vip,
    this.doz,
    this.ovf,
    this.noteOps,
    this.airportsData,
  });

  List<dynamic> printReg() {
    return this.hnd;
  }
}
