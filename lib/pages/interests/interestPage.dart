import 'package:flutter/material.dart';
import '../../utils/colors/colors.dart';
import 'griditem.dart';
import 'setPage.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List<Item> itemList;
  List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }

  loadList() {
    itemList = List();
    selectedList = List();
    itemList.add(Item("assets/new_air.jpg", 1));
    itemList.add(Item("assets/new_air.jpg", 2));
    itemList.add(Item("assets/new_air.jpg", 3));
    itemList.add(Item("assets/new_air.jpg", 4));
    itemList.add(Item("assets/new_air.jpg", 5));
    itemList.add(Item("assets/new_air.jpg", 6));
    itemList.add(Item("assets/new_air.jpg", 7));
    itemList.add(Item("assets/new_air.jpg", 8));
  }

  Widget _buildButton() {
    return Positioned(
      right: 0,
      child: Container(
        // color: Colors.pink,
        margin: EdgeInsets.all(16),
        height: 40.0,
        width: 100.0,
        child: FlatButton(
          color: parentColor,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: Text(
            'Next',
            style: TextStyle(
              fontFamily: productSans,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          onPressed: () {
            for (int i = 0; i < selectedList.length; i++) {
              print('this is are the items ${selectedList[i].rank}');
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => SetPage()));
            }
          },
        ),
      ),
    );
  }

  Widget _buildBoldText() {
    return Container(
      child: Text(
        'Welcome to \nAylon',
        style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: productSans,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLightText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Pick 5 or more \nInterests',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: productSans,
        ),
      ),
    );
  }

  Widget _buildUpperLayout() {
    return Stack(
      children: <Widget>[
        Container(), //* THIS IS AN INVISIBLE PARENT THAT HELPS YOU LAYOUT YOUR BELOW WIDGETS
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBoldText(),
              _buildLightText(),
            ],
          ),
        ),

        _buildButton(),
      ],
    );
  }


  Widget _buildGridView({bool isSelected}) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: itemList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GridItem(
            item: itemList[index],
            isSelected: (bool value) {
              setState(() {
                if (value) {
                  selectedList.add(itemList[index]);
                } else {
                  selectedList.remove(itemList[index]);
                }
              });
              print("$index : $value");
            },
            key: Key(itemList[index].rank.toString()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        //***** SCROLL VIEW */
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildUpperLayout(),
                _buildGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}
