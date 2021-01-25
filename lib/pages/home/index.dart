import 'package:color_dart/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:quant/pages/home/discover/index.dart';
import 'package:quant/pages/home/market/index.dart';
import 'package:quant/pages/home/mine/index.dart';
import 'package:quant/values/color.dart' as res;
import 'package:quant/values/string.dart' as res;

class Home extends StatefulWidget {
  final String routeName;
  final Object arguments;

  static Market _market = Market();
  static Discover _discover = Discover();
  static Mine _mine = Mine();

  final Map<int, Map> pages = {
    0: _createPage(_market, appbar: _market.getAppBar(), routeName: '/market'),
    1: _createPage(_discover,
        appbar: _discover.getAppBar(), routeName: '/discover'),
    2: _createPage(_mine, appbar: _mine.getAppBar(), routeName: '/mine'),
  };

  static Map _createPage(Widget page, {AppBar appbar, String routeName}) {
    return {"widget": page, "appbar": appbar, "routeName": routeName};
  }

  static Home _singleton;

  Home.singleton({this.routeName, this.arguments});

  factory Home({String routeName, Object arguments}) {
    if (_singleton == null) {
      _singleton = Home.singleton(routeName: routeName, arguments: arguments);
    }
    return _singleton;
  }

  getPageIndex(routeName) {
    switch (routeName) {
      case '/market':
        return 0;
      case '/discover':
        return 1;
      case '/mine':
        return 2;
      default:
        return 0;
    }
  }

  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Home> {
  static int currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();

    Future.delayed(Duration.zero, () {
      String routeName = ModalRoute.of(context).settings.name;
      setState(() {
        currentIndex = widget.getPageIndex(routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: widget.pages.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.pages[index]['widget'];
          },
        ),
        bottomNavigationBar: Theme(
            data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: res.Strings.common_market,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: res.Strings.common_discover,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  label: res.Strings.common_mine,
                ),
              ],
              // 未选中字体大小
              unselectedFontSize: 11,
              // 选中字体大小
              selectedFontSize: 12,
              // 选中字体颜色
              selectedItemColor: hex(res.Colors.colorPrimary),
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                _pageController.animateToPage(index,
                    duration: Duration(microseconds: 1), curve: Curves.ease);
              },
            )));
  }
}
