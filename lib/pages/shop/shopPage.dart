import 'package:aylon_frontend/pages/single_post/singlePostItem.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/button/button.dart';
import '../../utils/colors/colors.dart';
import '../../utils/constants.dart';
import '../Likes/singleCategoryViewLIkePage.dart';
import '../home/post.dart';
import '../interests/interestPage.dart';
import '../single_post/singlePost.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Item> images = [
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
  ];

  Widget _buildGridView() {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        itemCount: images.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                _getRemainingImages(startingIndex: index);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SinglePostPage(
                //       heroTag: images[index].imageUrl,
                //       shopName: 'Kabash shop',
                //       shopOwner: 'katepyt',
                //       shopProfileImage:
                //           'https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg',
                //       postImage: images[index].imageUrl,
                //       shopImages: _getRemainingImages(startingIndex: index),
                //     ),
                //   ),
                // );

                Object data = SinglePostItem(
                  heroTag: images[index].imageUrl,
                  shopName: 'Kabash shop',
                  shopOwner: 'katepyt',
                  shopProfileImage:
                      'https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg',
                  postImage: images[index].imageUrl,
                  shopImages: _getRemainingImages(startingIndex: index),
                );

                Navigator.pushNamed(context, SINGLE_POST_PAGE, arguments: data);
              },
              child: Container(
                child: Hero(
                    tag: images[index].imageUrl,
                    child: Image.asset(images[index].imageUrl)),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Item> _getRemainingImages({int startingIndex}) {
    List<Item> remainingImages = [];

    for (int i = startingIndex; i < images.length; i++) {
      remainingImages.add(images[i]);
    }
    print('>>> THE REMAINING IMAGES ARE : ${remainingImages}');
    return remainingImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppBar(context: context, title: 'Kabash Shop', elevation: 1),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              //* Whole shop profile info
              _buildShopProfile(),
              Divider(),

              (images.length < 1) ? _buildNoPostsyet() : _buildGridView(),

              //* Grid images
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoPostsyet() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Text(
            'No posts yet!',
            style: TextStyle(
              fontFamily: productSans,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShopProfile() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //* SHOP IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              image: AssetImage('assets/new_air.jpg'),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //* SHOP NAME
          Text(
            "Kabash Shop",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: productSans,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),

          //* SHOP SLOGAN
          Text(
            "A house brand for all great ladies in Kigali",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: productSans,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5,
          ),

          //* SHOP ADDRESS
          Text(
            "Door 512, 2nd floor Downtown",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: productSans,
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),

          //* SHOP OWNER
          Text(
            "CEO katepyt",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: productSans,
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),

          //* FOLLOW AND CONTACT BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildContactButton(),
              Expanded(
                child: _buildFollowButton(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: OutlineButton(
        child: Text(
          'Contact',
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
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
            color: Colors.white,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
