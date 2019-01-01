import 'package:exec/features/pay/pay_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exec/constants/constants.dart';
import 'package:exec/events/change_theme_event.dart';
import 'package:exec/util/data_utils.dart';
import 'package:exec/util/theme_utils.dart';
import 'pages/home/home_page.dart';
import 'pages/news/newsList_page.dart';
import 'pages/learn/learn_page.dart';
import 'pages/discovery/discovery_page.dart';
import 'pages/my/my_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:exec/app_strings.dart';
import 'package:exec/localizations_delegate.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  var tabImages;
  var _body;
  var appBarTitles = ['首页', '消息','学习', '发现', '我的'];


  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    DataUtils.getColorThemeIndex().then((index) {
      print('color theme index = $index');
      if (index != null) {
        Constants.eventBus.fire(
            new ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });
    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new NewsListPage(),
        new LearnPage(),
        new DiscoveryPage(),
        new PayPage()
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: themeColor
      ),
      localizationsDelegates: [
        AppLocalizationsDelegate(), // 我们定义的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [ // 支持的语言类型
        const Locale('en', 'US'), // English
        const Locale('zh', ''),
      ],
      onGenerateTitle: (context) {
        return AppStrings.of(context).title();
      },
      home: new Scaffold(
//        appBar: new AppBar(
//            title: new Text(appBarTitles[_tabIndex],
//                style: new TextStyle(color: Colors.white)),
//            iconTheme: new IconThemeData(color: Colors.white)
//        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              //icon: getTabIcon(0),
                icon: new Icon(Icons.home),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.assignment),
                title: getTabTitle(1)),

            new BottomNavigationBarItem(
                icon: new Icon(Icons.school),
                title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.business),
                title: getTabTitle(3)),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.perm_identity),
                title: getTabTitle(4)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
//          drawer: new MyDrawer()
      ),
    );
  }
}

