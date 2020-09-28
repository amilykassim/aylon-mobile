import 'package:aylon_frontend/pages/shop/shopPage.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../reusable_components/appbar/appbar.dart';
import '../../utils/colors/colors.dart';
import '../home/post.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin<DiscoverPage> {
  int currentPage = 0;
  final List<Post> posts = [
    Post(
        username: "Kabash Shop",
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
            "https://images.pexels.com/photos/884979/pexels-phoo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/ionuss/128.jpg",
        postImage:
            "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Johan",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/vinciarts/128.jpg",
        postImage:
            "https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "London",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/ssiskind/128.jpg",
        postImage:
            "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Jada",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/areus/128.jpg",
        postImage:
            "https://images.pexels.com/photos/169191/pexels-photo-169191.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Crawford",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/oskarlevinson/128.jpg",
        postImage:
            "https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBodyLayout(context, posts);
  }

  Widget _buildUpperTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Trending shops',
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: productSans,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBodyLayout(context, posts) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildUpperTitle(),
            // posts
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (ctx, i) {
                return _buildInformationContainer(
                    context: context,
                    username: posts[i].username,
                    profileImage: posts[i].userImage);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationContainer(
      {@required BuildContext context,
      @required String username,
      @required String profileImage}) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),

            //* PUT IT HERE
            child: _buildShopInformation(
                context: context,
                profileImage: profileImage,
                username: username),
            // child: _buildShopInformation(context: context, profileImage: posts[i].userImage, username: posts[i].username),
            //  child: ,
          ),

          //* IMAGES IN GRID VIEW
          _buildGridView(context)
        ],
      ),
    );
  }

  Widget _buildShopInformation(
      {@required BuildContext context, String username, String profileImage}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            //* SHOP PROFILE IMAGE TODO: UNCOMMENT SHOP PROFILE IMAGE AND FIX THE ERROR OF LOADING IMAGES
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(40),
            //   child: Image(
            //     image: NetworkImage(profileImage),
            //     width: 50,
            //     height: 50,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              width: 10,
            ),

            //* SHOP NAMES
            _buildShopName(context: context, username: username),
          ],
        ),
        _buildFollowButton()
      ],
    );
  }

  Widget _buildShopName({@required BuildContext context, username}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => ShopPage()));
              Navigator.pushNamed(context, SHOP_PAGE);
            },
            child: Text(
              username,
              style: TextStyle(
                  fontFamily: productSans,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            'Katepyt',
            style: TextStyle(fontFamily: productSans),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowButton() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: FlatButton(
        child: Text(
          'Follow',
          style: TextStyle(
            fontSize: 14,
            fontFamily: productSans,
          ),
        ),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => navigateTo));
        },
        color: childColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _buildGridView(@required BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        primary: false,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/new_air.jpg'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/black_white_shirt.jpg'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/black_yello_shirt.jpg'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/blue_jacket.jpg'),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
