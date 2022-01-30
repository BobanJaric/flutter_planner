import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/news_details.dart';
import '../widgets/list_news_item.dart';

import '../screens/colors.dart';
import '../widgets/app_drawer.dart';
import '../providers/news.dart';
import '../providers/new.dart';

import 'package:country_icons/country_icons.dart';

class NewsFindScreen extends StatefulWidget {
  static const routeName = '/user-news';
  final authToken;

  NewsFindScreen(this.authToken);

  @override
  _NewsFindScreenState createState() => _NewsFindScreenState(this.authToken);
}

class _NewsFindScreenState extends State<NewsFindScreen>
    with SingleTickerProviderStateMixin {
  final authToken;

  var listTiles = [];
  List<Tab> _tabList = [
    Tab(
      child: Text('Latest'),
    ),
    Tab(
      child: Text('Country'),
    ),
    Tab(
      child: Text('General'),
    ),
    Tab(
      child: Text('City'),
    ),
  ];

  TabController _tabController;

  _NewsFindScreenState(this.authToken);

  @override
  void initState() {
    super.initState();
    uploadNews();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('News'),
        centerTitle: true,
        toolbarHeight: 90,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 19),
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.black,
        child: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: listTiles[index],
                              tag: listTiles[index].category,
                            ),
                          ),
                        );
                      },
                      child: listWidget(listTiles[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles
                      .where((el) => el.category == 'country')
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: listTiles
                                  .where((el) => el.category == 'country')
                                  .toList()[index],
                              tag: listTiles
                                  .where((el) => el.category == 'country')
                                  .toList()[index]
                                  .category,
                            ),
                          ),
                        );
                      },
                      child: listWidget(listTiles
                          .where((el) => el.category == 'country')
                          .toList()[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles
                      .where((el) => el.category == 'general')
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: listTiles
                                  .where((el) => el.category == 'general')
                                  .toList()[index],
                              tag: listTiles
                                  .where((el) => el.category == 'general')
                                  .toList()[index]
                                  .category,
                            ),
                          ),
                        );
                      },
                      child: listWidget(listTiles
                          .where((el) => el.category == 'general')
                          .toList()[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles
                      .where((el) => el.category == 'city')
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: listTiles
                                  .where((el) => el.category == 'city')
                                  .toList()[index],
                              tag: listTiles
                                  .where((el) => el.category == 'city')
                                  .toList()[index]
                                  .category,
                            ),
                          ),
                        );
                      },
                      child: listWidget(listTiles
                          .where((el) => el.category == 'city')
                          .toList()[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future uploadNews() async {
    final news = await News.fetchAndSetNews(authToken);
    setState(() {
      this.listTiles = news;
    });
  }
}
