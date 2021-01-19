import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:quant/utils/constant.dart';
import 'package:quant/values/color.dart' as res;

import '../stock_list.dart';

class Market extends StatefulWidget {
  static _MarketState _marketState;

  Market() {
    _marketState = _MarketState();
  }

  getAppBar() => _marketState.createAppBar();

  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> with SingleTickerProviderStateMixin {
  TabController _tabController;

  static List<Label> _labels = Label.values.sublist(0,5);

  static List<Tab> _marketPageTabList = <Tab>[
    Tab(text: _labels[0].title),
    Tab(text: _labels[1].title),
    Tab(text: _labels[2].title),
    Tab(text: _labels[3].title),
    Tab(text: _labels[4].title),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: TabBar(
            tabs: _marketPageTabList,
            controller: _tabController,
            unselectedLabelColor: Colors.black54,
            labelColor: Colors.black87,
            indicatorColor: hex(res.Colors.colorPrimary),
            indicatorSize: TabBarIndicatorSize.label,
            // labelPadding: EdgeInsets.only(top: 20),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          StockListView(_labels[0].label),
          StockListView(_labels[1].label),
          StockListView(_labels[2].label),
          StockListView(_labels[3].label),
          StockListView(_labels[4].label),
        ],
      ),
    );
  }
}


