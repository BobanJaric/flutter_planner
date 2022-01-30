import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/flight.dart';
import '../providers/flights.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _dateFocusNode = FocusNode();
  final _regFocusNode = FocusNode();
  final _noteFocusNode = FocusNode();
  final _origin1FocusNode = FocusNode();
  final _destination1FocusNode = FocusNode();
  final _departureTime1FocusNode = FocusNode();
  final _arrivalTime1FocusNode = FocusNode();
  final _origin2FocusNode = FocusNode();
  final _destination2FocusNode = FocusNode();
  final _departureTime2FocusNode = FocusNode();
  final _arrivalTime2FocusNode = FocusNode();

  final _origin3FocusNode = FocusNode();
  final _destination3FocusNode = FocusNode();
  final _departureTime3FocusNode = FocusNode();
  final _arrivalTime3FocusNode = FocusNode();

  final _origin4FocusNode = FocusNode();
  final _destination4FocusNode = FocusNode();
  final _departureTime4FocusNode = FocusNode();
  final _arrivalTime4FocusNode = FocusNode();

  final _paxNbr1FocusNode = FocusNode();
  final _paxNbr2FocusNode = FocusNode();
  final _paxNbr3FocusNode = FocusNode();
  final _paxNbr4FocusNode = FocusNode();

  final _form = GlobalKey<FormState>();
  DateTime _selectedDate;
  DateTime _selectedDate2;
  DateTime _selectedDate3;
  DateTime _selectedDate4;

  var _editedFlight = Flight(
    id: null,
    registration: '',
    date1: null,
    date2: null,
    date3: null,
    date4: null,
    departureTime1: '',
    departureTime2: '',
    departureTime3: '',
    departureTime4: '',
    originIcao1: '',
    originIcao2: '',
    originIcao3: '',
    originIcao4: '',
    destinationIcao1: '',
    destinationIcao2: '',
    destinationIcao3: '',
    destinationIcao4: '',
    arrivalTime1: '',
    arrivalTime2: '',
    arrivalTime3: '',
    arrivalTime4: '',
    note: '',
    paxnbr1: '',
    paxnbr2: '',
    paxnbr3: '',
    paxnbr4: '',
    flightType1: '',
    flightType2: '',
    flightType3: '',
    flightType4: '',
  );
  var _initValues = {
    'registration': '',
    'date1': '',
    'date2': '',
    'date3': '',
    'date4': '',
    'departureTime1': '',
    'departureTime2': '',
    'departureTime3': '',
    'departureTime4': '',
    'originIcao1': '',
    'originIcao2': '',
    'originIcao3': '',
    'originIcao4': '',
    'destinationIcao1': '',
    'destinationIcao2': '',
    'destinationIcao3': '',
    'destinationIcao4': '',
    'arrivalTime1': '',
    'arrivalTime2': '',
    'arrivalTime3': '',
    'arrivalTime4': '',
    'note': '',
    'paxnbr1': '',
    'paxnbr2': '',
    'paxnbr3': '',
    'paxnbr4': '',
    'flightType1': '',
    'flightType2': '',
    'flightType3': '',
    'flightType4': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        //provera da li imamo product ili ga dodajemo prvi put
        _editedFlight =
            Provider.of<Flights>(context, listen: false).findById(productId);

        _initValues = {
          'registration': _editedFlight.registration,
          'note': _editedFlight.note,
          'departureTime1': _editedFlight.departureTime1.toString(),
          'departureTime2': _editedFlight.departureTime2.toString(),
          'departureTime3': _editedFlight.departureTime3.toString() == null
              ? ''
              : _editedFlight.departureTime3.toString(),
          'departureTime4': _editedFlight.departureTime4.toString() == null
              ? ''
              : _editedFlight.departureTime4.toString(),
          'arrivalTime1': _editedFlight.arrivalTime1.toString(),
          'arrivalTime2': _editedFlight.arrivalTime2.toString(),
          'arrivalTime3': _editedFlight.arrivalTime3.toString() == null
              ? ''
              : _editedFlight.arrivalTime3.toString(),
          'arrivalTime4': _editedFlight.arrivalTime4.toString() == null
              ? ''
              : _editedFlight.arrivalTime4.toString(),
          'originIcao1': _editedFlight.originIcao1.toString(),
          'originIcao2': _editedFlight.originIcao2.toString(),
          'originIcao3': _editedFlight.originIcao3.toString() == null
              ? ''
              : _editedFlight.originIcao3.toString(),
          'originIcao4': _editedFlight.originIcao4.toString() == null
              ? ''
              : _editedFlight.originIcao4.toString(),
          'destinationIcao1': _editedFlight.destinationIcao1.toString(),
          'destinationIcao2': _editedFlight.destinationIcao2.toString(),
          'destinationIcao3': _editedFlight.destinationIcao3.toString() == null
              ? ''
              : _editedFlight.destinationIcao3.toString(),
          'destinationIcao4': _editedFlight.destinationIcao4.toString() == null
              ? ''
              : _editedFlight.destinationIcao4.toString(),
          'date1': _editedFlight.date1,
          'date2': _editedFlight.date2,
          'date3': _editedFlight.date3 == null ? '' : _editedFlight.date3,
          'date4': _editedFlight.date4 == null ? '' : _editedFlight.date4,
          'paxnbr1': _editedFlight.paxnbr1,
          'paxnbr2': _editedFlight.paxnbr2,
          'paxnbr3': _editedFlight.paxnbr3 == null ? '' : _editedFlight.paxnbr3,
          'paxnbr4': _editedFlight.paxnbr4 == null ? '' : _editedFlight.paxnbr4,
          'flightType1': _editedFlight.flightType1,
          'flightType2': _editedFlight.flightType2,
          'flightType3': _editedFlight.flightType3 == null
              ? ''
              : _editedFlight.flightType3,
          'flightType4': _editedFlight.flightType4 == null
              ? ''
              : _editedFlight.flightType3,
        };

        _selectedDate = DateTime.parse(_initValues['date1']);

        if (_initValues['date2'] != '') {
          _selectedDate2 = DateTime.parse(_initValues['date2']);
        }
        if (_initValues['date3'] != '') {
          _selectedDate3 = DateTime.parse(_initValues['date3']);
        }
        if (_initValues['date4'] != '') {
          _selectedDate4 = DateTime.parse(_initValues['date4']);
        }
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _dateFocusNode.dispose();
    _regFocusNode.dispose();
    _noteFocusNode.dispose();
    _origin1FocusNode.dispose();
    _destination1FocusNode.dispose();
    _departureTime1FocusNode.dispose();
    _arrivalTime1FocusNode.dispose();
    _origin2FocusNode.dispose();
    _destination2FocusNode.dispose();
    _departureTime2FocusNode.dispose();
    _arrivalTime2FocusNode.dispose();
    _origin3FocusNode.dispose();
    _destination3FocusNode.dispose();
    _departureTime3FocusNode.dispose();
    _arrivalTime3FocusNode.dispose();
    _origin4FocusNode.dispose();
    _destination4FocusNode.dispose();
    _departureTime4FocusNode.dispose();
    _arrivalTime4FocusNode.dispose();
    _paxNbr1FocusNode.dispose();
    _paxNbr2FocusNode.dispose();
    _paxNbr3FocusNode.dispose();
    _paxNbr4FocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    print(_editedFlight.departureTime1);
    print(isValid);
    /*  if (!isValid) {
      return;
    } */
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedFlight.id != null) {
      await Provider.of<Flights>(context, listen: false)
          .updateProduct(_editedFlight.id, _editedFlight);
    } else {
      try {
        await Provider.of<Flights>(context, listen: false)
            .addFlight(_editedFlight);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occured'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  })
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _setDatePicker(int a) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        if (a == 1) {
          setState(
            () {
              _selectedDate = pickedDate;
            },
          );
        } else if (a == 2) {
          setState(
            () {
              _selectedDate2 = pickedDate;
            },
          );
        } else if (a == 3) {
          setState(
            () {
              _selectedDate3 = pickedDate;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_editedFlight.date1);
    final date1Corr = _selectedDate != null
        ? _selectedDate.toIso8601String().substring(0, 10)
        : '';
    final date2Corr = _selectedDate2 != null
        ? _selectedDate2.toIso8601String().substring(0, 10)
        : '';
    var textFormEtd1 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.departureTime1,
      decoration: InputDecoration(
        labelText: 'ETD1',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _departureTime1FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: value,
          departureTime2: _editedFlight.departureTime2,
          departureTime4: _editedFlight.departureTime4,
          departureTime3: _editedFlight.departureTime3,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormOrigin1 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.originIcao1,
      decoration: InputDecoration(
        labelText: 'Origin1',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _origin1FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a origin';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao4: _editedFlight.originIcao4,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao1: value,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao2,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormDestination1 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.destinationIcao1,
      decoration: InputDecoration(
        labelText: 'Dest1',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _destination1FocusNode,
      /*      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a destination';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao4: _editedFlight.destinationIcao4,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao1: value,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormEta1 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.arrivalTime1,
      decoration: InputDecoration(
        labelText: 'ETA1',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _arrivalTime1FocusNode,
/*       onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime1: value,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormPaxNbr1 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.paxnbr1,
      decoration: InputDecoration(
        labelText: 'Pax1',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _paxNbr1FocusNode,
/*       onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime1: _editedFlight.arrivalTime1,
          paxnbr1: value,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );

    var textFormEtd2 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.departureTime2,
      decoration: InputDecoration(
        labelText: 'ETD2',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _departureTime2FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: value,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          date1: date1Corr,
          date2: date2Corr,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormOrigin2 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.originIcao2,
      decoration: InputDecoration(
        labelText: 'Origin2',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _origin2FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a origin';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao4: _editedFlight.originIcao4,
          originIcao3: _editedFlight.originIcao3,
          originIcao2: value,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao2,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormDestination2 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.destinationIcao2,
      decoration: InputDecoration(
        labelText: 'Dest2',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _destination2FocusNode,
      /*      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a destination';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao4: _editedFlight.destinationIcao4,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao2: value,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormEta2 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.arrivalTime2,
      decoration: InputDecoration(
        labelText: 'ETA2',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _arrivalTime2FocusNode,
/*       onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime2: value,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormPaxNbr2 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.paxnbr2,
      decoration: InputDecoration(
        labelText: 'Pax2',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _paxNbr2FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime1: _editedFlight.arrivalTime1,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: value,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );

    var textFormEtd3 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.departureTime3,
      decoration: InputDecoration(
        labelText: 'ETD3',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _departureTime3FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime4: _editedFlight.departureTime4,
          departureTime3: value,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormOrigin3 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.originIcao3,
      decoration: InputDecoration(
        labelText: 'Origin3',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _origin3FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a origin';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao4: _editedFlight.originIcao4,
          originIcao3: value,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao2,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormDestination3 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.destinationIcao3,
      decoration: InputDecoration(
        labelText: 'Dest3',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _destination3FocusNode,
      /*      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a destination';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao4: _editedFlight.destinationIcao4,
          destinationIcao3: value,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormEta3 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.arrivalTime3,
      decoration: InputDecoration(
        labelText: 'ETA3',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _arrivalTime3FocusNode,
/*       onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime3: value,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormPaxNbr3 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.paxnbr3,
      decoration: InputDecoration(
        labelText: 'Pax3',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _paxNbr3FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime1: _editedFlight.arrivalTime1,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr3: value,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );

    var textFormEtd4 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.departureTime4,
      decoration: InputDecoration(
        labelText: 'ETD4',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _departureTime4FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: value,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormOrigin4 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.originIcao4,
      decoration: InputDecoration(
        labelText: 'Origin4',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _origin4FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a origin';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: value,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao2,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormDestination4 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.destinationIcao4,
      decoration: InputDecoration(
        labelText: 'Dest4',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _destination4FocusNode,
      /*      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a destination';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: value,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: _editedFlight.arrivalTime4,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormEta4 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.arrivalTime4,
      decoration: InputDecoration(
        labelText: 'ETA4',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _arrivalTime4FocusNode,
/*       onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_descriptionFocusNode);
      }, */
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime4: value,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr4: _editedFlight.paxnbr4,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    var textFormPaxNbr4 = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _editedFlight.paxnbr4,
      decoration: InputDecoration(
        labelText: 'Pax4',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: _paxNbr4FocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a etd';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          departureTime3: _editedFlight.departureTime3,
          departureTime4: _editedFlight.departureTime4,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          originIcao3: _editedFlight.originIcao3,
          originIcao4: _editedFlight.originIcao4,
          date1: date1Corr,
          date2: date2Corr,
          date3: _editedFlight.date3,
          date4: _editedFlight.date4,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          destinationIcao3: _editedFlight.destinationIcao3,
          destinationIcao4: _editedFlight.destinationIcao4,
          arrivalTime4: _editedFlight.arrivalTime4,
          arrivalTime2: _editedFlight.arrivalTime2,
          arrivalTime3: _editedFlight.arrivalTime3,
          arrivalTime1: _editedFlight.arrivalTime1,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr4: value,
          paxnbr3: _editedFlight.paxnbr3,
          paxnbr2: _editedFlight.paxnbr2,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          flightType3: _editedFlight.flightType3,
          flightType4: _editedFlight.flightType4,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );

    var textFormNote = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _initValues['note'],
      decoration: InputDecoration(
        labelText: 'Note',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      focusNode: _noteFocusNode,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide a Note';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          date1: date1Corr,
          date2: date2Corr,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          note: value,
          id: _editedFlight.id,
        );
      },
    );
    var textFormReg = TextFormField(
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 18),
      initialValue: _initValues['registration'],
      decoration: InputDecoration(
        labelText: 'Registration',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        /* fillColor: Colors.black, */
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_regFocusNode);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide a Registration';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          registration: value,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          date1: date1Corr,
          date2: date2Corr,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    );
    /*    var textFormDate = TextFormField(
      style: TextStyle(color: Colors.white),
      initialValue: _initValues['date1'],
      decoration: InputDecoration(
        labelText: 'Date',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.black,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_dateFocusNode);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please provide a Date';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _editedFlight = Flight(
          departureTime1: _editedFlight.departureTime1,
          departureTime2: _editedFlight.departureTime2,
          registration: _editedFlight.registration,
          originIcao1: _editedFlight.originIcao1,
          originIcao2: _editedFlight.originIcao2,
          date1: value,
          date2: _editedFlight.date2,
          destinationIcao1: _editedFlight.destinationIcao1,
          destinationIcao2: _editedFlight.destinationIcao2,
          arrivalTime1: _editedFlight.arrivalTime1,
          arrivalTime2: _editedFlight.arrivalTime2,
          paxnbr1: _editedFlight.paxnbr1,
          paxnbr2: _editedFlight.paxnbr2,
          flightType1: _editedFlight.flightType1,
          flightType2: _editedFlight.flightType2,
          note: _editedFlight.note,
          id: _editedFlight.id,
        );
      },
    ); */
    var date1 = SizedBox(
      child: Row(
        children: [
          Text('Date1'),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black, //background color of button
                side: BorderSide(
                    width: 1, color: Colors.white), //border width and color
                elevation: 2, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(10) //content padding inside button
                ),
            child: Text(
              _selectedDate == null
                  ? 'No day chosen'
                  : DateFormat.yMd().format(_selectedDate),
            ),
            onPressed: () {
              _setDatePicker(1);
            },
          ),
        ],
      ),
      width: 130,
    );
    var date2 = SizedBox(
      child: Row(
        children: [
          Text('Date2'),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black, //background color of button
                side: BorderSide(
                    width: 1, color: Colors.white), //border width and color
                elevation: 2, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(10) //content padding inside button
                ),
            child: Text(
              _selectedDate2 == null
                  ? 'No day chosen'
                  : DateFormat.yMd().format(_selectedDate2),
            ),
            onPressed: () {
              _setDatePicker(2);
            },
          ),
        ],
      ),
      width: 130,
    );
    var date3 = SizedBox(
      child: Row(
        children: [
          Text('Date3'),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black, //background color of button
                side: BorderSide(
                    width: 1, color: Colors.white), //border width and color
                elevation: 2, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(10) //content padding inside button
                ),
            child: Text(
              _selectedDate3 == null
                  ? 'No day chosen'
                  : DateFormat.yMd().format(_selectedDate3),
            ),
            onPressed: () {
              _setDatePicker(3);
            },
          ),
        ],
      ),
      width: 130,
    );
    var date4 = SizedBox(
      child: Row(
        children: [
          Text('Date4'),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black, //background color of button
                side: BorderSide(
                    width: 1, color: Colors.white), //border width and color
                elevation: 2, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(10) //content padding inside button
                ),
            child: Text(
              _selectedDate4 == null
                  ? 'No day chosen'
                  : DateFormat.yMd().format(_selectedDate4),
            ),
            onPressed: () {
              _setDatePicker(4);
            },
          ),
        ],
      ),
      width: 130,
    );

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
        title: Text('Edit Flight'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black,
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: _form,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            /*  SizedBox(
                              /* child: textFormDate, */
                              child: Column(
                                children: [
                                  Text('Date1'),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                    ),
                                    child: Text(
                                      _selectedDate == null
                                          ? 'No day chosen'
                                          : DateFormat.yMd()
                                              .format(_selectedDate),
                                    ),
                                    onPressed: _setDatePicker,
                                  ),
                                ],
                              ),
                              width: 130,
                            ), */
                            Expanded(
                              child: SizedBox(),
                            ),
                            SizedBox(
                              child: textFormReg,
                              width: 150,
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        date1,
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(child: textFormEtd1, width: 70),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(child: textFormOrigin1, width: 70),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(child: textFormDestination1, width: 70),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(child: textFormEta1, width: 70),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(child: textFormPaxNbr1, width: 50),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date2 != '' ? date2 : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date2 != ''
                            ? Row(
                                children: [
                                  SizedBox(child: textFormEtd2, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormOrigin2, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      child: textFormDestination2, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormEta2, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormPaxNbr2, width: 50),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date3 != '' ? date3 : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date3 == ''
                            ? SizedBox()
                            : Row(
                                children: [
                                  SizedBox(child: textFormEtd3, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormOrigin3, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      child: textFormDestination3, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormEta3, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormPaxNbr3, width: 50),
                                ],
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date4 != '' ? date4 : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        _editedFlight.date4 != ''
                            ? Row(
                                children: [
                                  SizedBox(child: textFormEtd4, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormOrigin4, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      child: textFormDestination4, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormEta4, width: 70),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(child: textFormPaxNbr4, width: 55),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        textFormNote,
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
