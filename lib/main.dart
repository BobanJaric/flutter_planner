import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/flights_overview_screen.dart';
import 'screens/flight_detail_screen.dart';
import './screens/splash_screen.dart';
import './providers/flights.dart';
import './providers/notes.dart';
import './providers/auth.dart';
import 'screens/user_flights_screen.dart';
import 'screens/edit_flight_screen.dart';
import './screens/auth_screen.dart';
import './screens/LoginPage.dart';
import '../providers/airport.dart';
import '../providers/airports.dart';
import '../screens/user_find_news.dart';
import './screens/user_find_airport.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Flights>(
          create: null,
          update: (ctx, auth, previousProducts) => Flights(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Notes>(
          create: null,
          update: (ctx, auth, previousProducts) => Notes(
            auth.token,
            previousProducts == null ? [] : previousProducts.notes,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'PrinceOPS',
            theme: ThemeData(
              primarySwatch: Colors.red,
              accentColor: Colors.blueAccent,
              fontFamily: 'Lato',
            ),
            home: auth.expiryDate == true
                ? FlightsOverviewScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) => authResultSnapshot
                                .connectionState ==
                            ConnectionState.waiting
                        ? SplashScreen()
                        /*   : auth.isAuth
                                ? ProductsOverviewScreen() */
                        /* : AuthScreen(), */
                        : LoginPage(),
                  ),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
              AirportFindScreen.routeName: (ctx) =>
                  AirportFindScreen(auth.token),
              NewsFindScreen.routeName: (ctx) => NewsFindScreen(auth.token),
            }),
      ),
    );
  }
}
