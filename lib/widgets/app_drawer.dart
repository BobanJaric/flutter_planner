import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/user_flights_screen.dart';
import '../screens/user_find_airport.dart';
import '../screens/user_find_news.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              AppBar(
                title: Container(
                  child: Text('PrinceOPS App'),
                ),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                leading: Icon(
                  Icons.flight_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Flights',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                title: Text(
                  'Manage Flights',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(UserProductsScreen.routeName);
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: Text(
                  'Find airport',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AirportFindScreen.routeName);
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.now_widgets,
                  color: Colors.white,
                ),
                title: Text(
                  'News',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(NewsFindScreen.routeName);
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/');
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
