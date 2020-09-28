import 'package:aylon_frontend/pages/discover/discoverPage.dart';
import 'package:aylon_frontend/pages/home/homePage.dart';
import 'package:aylon_frontend/pages/home/test.dart';
import 'package:aylon_frontend/pages/setting/settingPage.dart';
import 'package:aylon_frontend/pages/shop/shopPage.dart';
import 'package:aylon_frontend/pages/single_post/singlePost.dart';
import 'package:aylon_frontend/pages/single_post/singlePostItem.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home/startPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
      onGenerateRoute: (RouteSettings settings) {
        final data = settings.arguments;
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => HomePage(), settings: settings);
          case SETTING_PAGE:
            return CupertinoPageRoute(
                builder: (_) => SettingPage(), settings: settings);
          case DISCOVER_PAGE:
            return CupertinoPageRoute(
                builder: (_) => DiscoverPage(), settings: settings);
          case SHOP_PAGE:
            return CupertinoPageRoute(
                builder: (_) => ShopPage(), settings: settings);
          case SINGLE_POST_PAGE:
            return CupertinoPageRoute(
              builder: (_) => SinglePostPage(data: data),
              settings: settings,
            );

          // TODO: ADD A DEFAULT ROUTE IN CASE NOTHING MATCH. IT WILL SUPPRESS THE ABOVE WARNING
        }
      },
    );
  }
}
