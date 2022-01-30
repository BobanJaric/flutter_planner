import 'dart:ui';

import 'package:flutter/material.dart';
import '../providers/new.dart';

Widget listWidget(New item) {
  return Card(
    color: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), // if you need this
      side: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 1,
      ),
    ),
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          child: Row(
            children: [
              item.country != ''
                  ? Image.asset(
                      'icons/flags/png/${item.code}.png',
                      package: 'country_icons',
                      width: 90.0,
                      height: 70.0,
                    )
                  : SizedBox(
                      width: 80,
                    ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
/*                     Text(
                      item.headline,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ), */
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: item.headline,
                            style: TextStyle(
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          item.country,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          item.city,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(Icons.date_range),
                        Text(
                          item.date,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
