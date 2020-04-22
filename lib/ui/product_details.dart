import 'package:flutter/material.dart';
import 'package:get_supper/ui/utils/uidata.dart';



class SingleProduct extends StatefulWidget {

  final productName;
  final productPrice;
  final productPicture;


  SingleProduct(
      {this.productName,
        this.productPicture,
        this.productPrice});



  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              // height: 300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                // bottomRight:
              ),
                  side:  BorderSide(width: 2.0, color: Uidata.accentColor),
              ),
            )
          ],
        ),
      )
      
    );
  }
}