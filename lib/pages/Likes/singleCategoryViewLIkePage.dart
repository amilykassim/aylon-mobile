import 'package:flutter/material.dart';

import '../../reusable_components/appbar/appbar.dart';

class SingleCategoryViewLikePage extends StatefulWidget {
  final String title;
  SingleCategoryViewLikePage({Key key, this.title}) : super(key: key);

  @override
  _SingleCategoryViewLikePageState createState() =>
      _SingleCategoryViewLikePageState();
}

class _SingleCategoryViewLikePageState
    extends State<SingleCategoryViewLikePage> {
  final List<String> images = [
    'assets/new_air.jpg',
    'assets/black_white_shirt.jpg',
    'assets/black_yello_shirt.jpg',
    'assets/blue_jacket.jpg',
    'assets/mix_color_shirt.jpg',
    'assets/t_shirt_grey.jpg',
    'assets/kitenge_tshirt.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(context: context, title: widget.title, elevation: 1),
      body: SafeArea(
        child: _buildGridView(context: context, images: images),
      ),
    );
  }

  Widget _buildGridView({BuildContext context, List images}) {
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
            child: Container(
              child: Image.asset(images[index]),
            ),
          );
        },
      ),
    );
  }
}
