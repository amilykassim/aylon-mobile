import 'package:aylon_frontend/pages/single_post/singlePostItem.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../utils/colors/colors.dart';
import '../discover/discoverPage.dart';
import '../interests/interestPage.dart';
import '../single_post/singlePost.dart';
import 'post.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  int currentPage = 0;

  List<Item> itemList = [
    Item("assets/new_air.jpg", 1),
    Item("assets/black_white_shirt.jpg", 2),
    Item("assets/black_yello_shirt.jpg", 3),
    Item("assets/blue_jacket.jpg", 4),
    Item("assets/jordan.jpg", 5),
    Item("assets/kitenge_tshirt.jpg", 5),
    Item("assets/mix_color_shirt.jpg", 5),
    Item("assets/shark_tshirt.jpg", 6),
    Item("assets/t_shirt_grey.jpg", 6),
    Item("assets/three_color_tshirt.jpeg", 6),
    Item("assets/white_jacket.jpg", 7),
    Item("assets/white_tshirt.jpg", 7),
    Item("assets/Tarzan.jpg", 7),
    // Item("assets/new_air.jpg", 7),
  ];

  List<Post> posts = [
    Post(
        username: "Brianne",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage:
            "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg",
        postImage:
            "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  Widget _buildGridView() {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        itemCount: itemList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SinglePostPage(
                //       heroTag: itemList[index].imageUrl,
                //       shopName: 'Kabash shop',
                //       shopOwner: 'katepyt',
                //       shopProfileImage:
                //           'https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg',
                //       postImage: itemList[index].imageUrl,
                //     ),
                //   ),
                // );

                Object data = SinglePostItem(
                  heroTag: itemList[index].imageUrl,
                  shopName: 'Kabash shop',
                  shopOwner: 'katepyt',
                  shopProfileImage:
                      'https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg',
                  postImage: itemList[index].imageUrl,
                );

                Navigator.pushNamed(context, SINGLE_POST_PAGE, arguments: data);
              },
              child: Container(
                child: Hero(
                    tag: itemList[index].imageUrl,
                    child: Image.asset(itemList[index].imageUrl)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpperTitle() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16, left: 10, right: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Products',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: productSans,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 26, left: 10, right: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'you might like',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 2,
                  fontFamily: productSans),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildUpperTitle(),
          _buildGridView(),
        ],
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   // appBar: setAppBar(title: 'Aylon', isHomePage: true, context: context),
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       physics: BouncingScrollPhysics(),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: <Widget>[
    //           _buildUpperTitle(),
    //           gridPage,
    //         ],
    //       ),
    //     ),
    //   ),
    //   // bottomNavigationBar: _buildBottonNavigationBar(),
    // );
  }

  @override
  bool get wantKeepAlive => true;
}
