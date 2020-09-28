import 'package:aylon_frontend/reusable_components/appbar/appbar.dart';
import 'package:aylon_frontend/reusable_components/refresh_page/refreshPage.dart';
import 'package:flutter/material.dart';
import '../Likes/likePage.dart';
import '../discover/discoverPage.dart';
import 'homePage.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: setAppBar(title: 'Aylon', isHomePage: true, context: context),
        body: TabBarView(
          children: [
            RefreshPage(page: HomePage()),
            RefreshPage(page: DiscoverPage()),
            RefreshPage(page: LikePage()),
          ],
        ),
        bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.explore),
              ),
              Tab(
                icon: Icon(FontAwesome.heart_o),
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            // indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.transparent),
      ),
    );
  }
}
