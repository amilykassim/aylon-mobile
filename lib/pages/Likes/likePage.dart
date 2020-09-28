import 'package:flutter/material.dart';

import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/button/button.dart';
import '../../utils/colors/colors.dart';
import '../home/post.dart';
import '../home/startPage.dart';
import 'singleCategoryViewLIkePage.dart';

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage>
    with AutomaticKeepAliveClientMixin<LikePage> {
  int currentPage = 0;
  int imagesWeWantToShow = 4;

  final List<Post> posts = [
    Post(
        username: "Air Jordan",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage:
            "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Jackets",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/kevka/128.jpg",
        postImage:
            "https://images.pexels.com/photos/884979/pexels-phoo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "T-Shirts",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/ionuss/128.jpg",
        postImage:
            "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Shirts",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/vinciarts/128.jpg",
        postImage:
            "https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Capes",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/ssiskind/128.jpg",
        postImage:
            "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Sneakers",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/areus/128.jpg",
        postImage:
            "https://images.pexels.com/photos/169191/pexels-photo-169191.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Jumpers",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/oskarlevinson/128.jpg",
        postImage:
            "https://images.pexels.com/photos/1252983/pexels-photo-1252983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //* TESTING IMAGES
    final List<String> images = [
      // 'assets/new_air.jpg',
      // 'assets/black_white_shirt.jpg',
      // 'assets/black_yello_shirt.jpg',
      // 'assets/blue_jacket.jpg',
      // 'assets/mix_color_shirt.jpg',
      // 'assets/t_shirt_grey.jpg',
      // 'assets/kitenge_tshirt.jpg',
    ];

    imagesWeWantToShow = 3;
    Map<String, Object> returnedImages = imagesToShow(images);

    return _buildBodyLayout(
        context: context, posts: posts, images: returnedImages);
  }

  Widget _buildUpperTitle(
      {@required String title,
      double marginTop = 0,
      double marginLeft = 10.0}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, left: marginLeft, right: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: productSans,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildNoSavedImagesLayout() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'When you like images, you will find them here. everything of yours is organized with Aylon',
            style: TextStyle(
              fontFamily: productSans,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Button(
            text: 'Find me something',
            color: Colors.black,
            navigateTo: StartPage(),
          )
        ],
      ),
    );
  }

  Widget _buildBodyLayout({context, posts, images}) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            //* if there is no images, show the upper title
            if (images['noImages'] == true)
              Column(
                children: <Widget>[
                  _buildUpperTitle(
                      title: 'Liked Products', marginTop: 30, marginLeft: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'All of the things you want to buy in future will be here',
                      style: TextStyle(fontFamily: productSans, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),

            //* if there is liked images, show them
            if (images['noImages'] == false)
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (ctx, i) {
                  return _buildInformationContainer(
                      context: context,
                      username: posts[i].username,
                      images: images);
                },
              ),

            //* If there is no images
            if (images['noImages'] == true)
              _buildNoSavedImagesLayout()
          ],
        ),
      ),
    );
  }

  //* This contains the upper title and the grid view of images
  Widget _buildInformationContainer(
      {@required BuildContext context,
      @required String username,
      @required Map<String, Object> images}) {
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

            //* CATEGORY
            child: _buildUpperTitle(title: username),
          ),

          //* IMAGES IN GRID VIEW
          _buildGridView(context: context, images: images, title: username)
        ],
      ),
    );
  }

  Widget _buildGridView(
      {@required BuildContext context,
      @required Map<String, Object> images,
      String title}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        primary: false,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        children: <Widget>[
          for (var image in images['imagesToShow'])
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: <Widget>[
                  Image.asset(image),
                  if (image == images['lastImageToShow'] &&
                      images['remainingImages'] != 0)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SingleCategoryViewLikePage(title: title)));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          '+${images['remainingImages']} More',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }

  Map<String, Object> imagesToShow(List images) {
    List imagesToShow = [];

    for (var i = 1; i <= images.length; i++) {
      //* minus 1, because we started counting at 1 instead of 0
      imagesToShow.add(images[i - 1]);

      if (i == (imagesWeWantToShow)) break;
    }

    //* if there is no images, set noImages to true
    var noImages = {'noImages': true};

    //* if there is images, set noImages to false, and other properties
    if (images.length > 1) {
      var result = {
        'imagesToShow': imagesToShow,
        'lastImageToShow': imagesToShow[imagesToShow.length - 1],
        'remainingImages': images.length - imagesToShow.length,
        'noImages': false
      };
      return result;
    }

    return noImages;
  }

  @override
  bool get wantKeepAlive => true;
}
