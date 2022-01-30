import 'package:flutter/material.dart';
import '../providers/new.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final New item;

  const DetailsScreen({Key key, @required this.item, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(
                        tag: '${item.category}',
                        child: item.country != ''
                            ? Container(
                                width: 130.0,
                                child: Image.asset(
                                  'icons/flags/png/${item.code}.png',
                                  package: 'country_icons',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SizedBox(
                                height: 80,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          Text(
                            item.headline,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                item.country != '' ? item.country : item.city,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Icon(Icons.date_range),
                              Text(
                                item.date,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            item.info,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
