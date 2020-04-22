import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:get_supper/ui/utils/uidata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  var product_list = [
    {
      "name": "Sadza and hooves",
      "picture": "assets/sadza1.jpg",
      "price": 120,
    },
    {
      "name": "Spaghetti",
      "picture": "assets/spag1.jpg",
      "price": 80,
    },
    {
      "name": "Macaroni",
      "picture": "assets/maca1.jpg",
      "price": 50,
    },
    {
      "name": "Sadza ghoulash",
      "picture": "assets/sadza2.jpg",
      "price": 110,
    },
    {
      "name": "Rice and beef",
      "picture": "assets/rice2.jpg",
      "price": 90,
    },
    {
      "name": "Roast Beef",
      "picture": "assets/beef2.jpg",
      "price": 80,
    },
    {
      "name": "Roast Pork",
      "picture": "assets/pork2.jpg",
      "price": 120,
    },
    {
      "name": "Spaghetti Magic",
      "picture": "assets/spag3.jpg",
      "price": 80,
    },
  ];
  

  int _selectedIndex = 0;


_buildButton(String title, int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedIndex = index;
      });
    },
      child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Uidata.primaryColor
        : Color(0xFFE7EBEE),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(title, style: TextStyle(
          color: _selectedIndex == index ? Colors.white
          : Colors.black,
        )),
      ),
      
    ),
  );
  // return  FlatButton(
  //   child: Text(title, style: TextStyle(color: Colors.black),),
  //   color: _selectedIndex == index? Color.fromRGBO(181,101,29, 1)
  //   : Color(0xFFE7EBEE),
  //   onPressed: () {
  //     setState(() {
  //       _selectedIndex = index;
  //       // tabController = _selectedIndex;
  //     });
  //   },
  // );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // title: Text("Get Supper", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Uidata.primaryColor,
            onPressed: (){},
          )
        ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text("What would you like to order?", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    _buildButton("All", 0),
                    _buildButton("Rice", 1),
                    _buildButton("Sadza", 2),
                    _buildButton("Specials", 3),
                  ],
                ),
              ),
              Divider(),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
                  ),
                              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return foodCard(
          product_list[index]['picture'],
          product_list[index]['name'],
          product_list[index]['price'],
          context
        );
      },
    ),
                ),
              ),
            ],
          )),
      );
  }

  Widget foodCard(String img, String title, int price, BuildContext context) {
    var rating;
    return Card(
      // color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        )
      ),
      child: Container(
        height: 200.0,
        // color: Colors.red ,
        child: Column(
          children: <Widget> [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)
                ),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    // color: Colors.red
                  ),
                height: 115.0,
                width: 171.0,
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                  ),
          ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(right: 70.0)
                    )
                    
                  ],
                ),
            ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("\$$price", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,)),
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
                        child: Container(
                        height: 20.0,
                        width: 20.0,
                        color: Uidata.primaryColor,
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(Icons.add),
                            iconSize: 20,
                            color: Colors.white,
                            onPressed: () {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Uidata.primaryColor,
                                elevation: 2.0,
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(Icons.add_shopping_cart),
                                    Text("$title added to cart"),
                                  ],
                                ),
                                // duration: Duration(seconds: 3),
                                )
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            
          // SmoothStarRating(
          //   allowHalfRating: false,
          //   onRatingChanged: (v) {
          //     rating = v;
          //     setState(() {});
          //   },
          //   starCount: 5,
          //   rating: rating,
          //   size: 40.0,
          //   filledIconData: Icons.blur_off,
          //   halfFilledIconData: Icons.blur_on,
          //   color: Colors.green,
          //   borderColor: Colors.green,
          //   spacing:0.0
          // )
          ]
        ),
      ),
    );
  }




}

