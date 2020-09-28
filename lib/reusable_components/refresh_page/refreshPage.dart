//* PULL TO REFRESH
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshPage extends StatefulWidget {
  final Widget page;
  RefreshPage({
    Key key,
    @required this.page,
  }) : super(key: key);

  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  //* TODO AFTER IMPLMEENTING THE WHOE FUNCTIONALITY, REMOVE THIS KEY AND TEST IF IT WORKs
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
        child: SmartRefresher(
          physics: BouncingScrollPhysics(),
          enablePullDown: true,
          enablePullUp: true,
          header: BezierCircleHeader(
            bezierColor: Colors.grey.shade100,
            circleColor: Colors.black,
            rectHeight: 60.0,
            circleType: BezierCircleType.Raidal,
          ),
          footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                //* ADD SNACKBARS FOR NOTIFYING A USER
                if (mode == LoadStatus.idle) {
                  body = Text(''); // Pull up load
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text(''); // Load failed, Click to retry!
                } else if (mode == LoadStatus.canLoading) {
                  body = Text(''); // Release to load more
                } else {
                  body = Text(''); // No more data
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
              loadStyle: LoadStyle.ShowWhenLoading),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          // footer:
          child: widget.page,
        ),
      ),
    );
  }

  _onLoading() async {
    await Future.delayed(Duration(milliseconds: 2000));

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));

    if (mounted) {
      setState(() {});
    }
    _refreshController.refreshCompleted();
  }

//* I DON'T KNOW WHAT IT DOES BUT I'LL TEST IT LATER
  // loadingpage() {
  //   FutureBuilder(
  //     future: txtlist(),
  //     builder: (context, load) {
  //     switch (load.connectionState) {
  //       case ConnectionState.none:
  //         return Text('');
  //         break;
  //       case ConnectionState.waiting:
  //         return CircularProgressIndicator();
  //         break;
  //       case ConnectionState.active:
  //         return Text('');
  //         break;
  //       case ConnectionState.done:
  //         return txtlist();
  //         break;
  //     }
  //     return Text('');
  //   });
  // }
}
