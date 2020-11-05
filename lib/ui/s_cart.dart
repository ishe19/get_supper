import 'package:flutter/material.dart';
import 'package:get_supper/model/db_manager.dart';
import 'package:get_supper/model/product.dart';
import 'package:get_supper/ui/utils/uidata.dart';
import 'package:ussd/ussd.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class ShoppingCart extends StatefulWidget {
  var list = [];

  ShoppingCart(this.list);
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  // variables
  int _total = 0;
  // int count = int.parse(DBManagerViews.getCount().toString());
  String _roomNumber = "";
  String _hostel = "";
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController _hostelController = TextEditingController();
  TextEditingController _paymentController = TextEditingController();
  int listLength;

  int listLengthC() {
    setState(() {
      listLength = widget.list.length;
    });
    return listLength;
  }

  int countTotal() {
    _total = 0;
    int j = listLengthC();
    for (int i = 0; i <= j - 1; i++) {
      _total += widget.list[i]['price'];
    }
    print(_total);
    return _total;
  }

  @override
  void initState() {
    super.initState();
    print(DateTime.now().toString().substring(8, 10));
    // print("$count");
    listLengthC();
    roomNumberController.addListener(() {
      setState(() {
        _roomNumber = roomNumberController.text;
      });
    });

    countTotal();

    _hostelController.addListener(() {
      setState(() {
        _hostel = _hostelController.text;
      });
    });
  }

  Future<void> launchUssd(String ussdCode) async {
    Ussd.runUssd(ussdCode);
  }

  var day = DateTime.now().weekday;
  var month = DateTime.now().month;

  String getDate(int day, int month) {
    String todayDate;
    String todayMonth;
    if (day == 1) {
      todayDate = "Monday";
    } else if (day == 2) {
      todayDate = "Tuesday";
    } else if (day == 3) {
      todayDate = "Wednesday";
    } else if (day == 4) {
      todayDate = "Thursday";
    } else if (day == 5) {
      todayDate = "Friday";
    } else if (day == 6) {
      todayDate = "Saturday";
    } else if (day == 7) {
      todayDate = "Sunday";
    }

    if (month == 1) {
      todayMonth = "January";
    } else if (month == 2) {
      todayMonth = "February";
    } else if (month == 3) {
      todayMonth = "March";
    } else if (month == 4) {
      todayMonth = "April";
    } else if (month == 5) {
      todayMonth = "May";
    } else if (month == 6) {
      todayMonth = "June";
    } else if (month == 7) {
      todayMonth = "July";
    } else if (month == 8) {
      todayMonth = "August";
    } else if (month == 9) {
      todayMonth = "September";
    } else if (month == 10) {
      todayMonth = "October";
    } else if (month == 11) {
      todayMonth = "November";
    } else if (month == 12) {
      todayMonth = "December";
    }
    String date = DateTime.now().toString().substring(8, 10);
    return "$todayDate, $date $todayMonth";
  }

  returnAlert() {
    return Alert(
        title: "Payment Confirmation and Address",
        desc:
            "Please paste in the payment confirmation message and please enter the destination where we should deliver.",
        context: context,
        content: Column(
          children: <Widget>[
            TextField(
              controller: roomNumberController,
              decoration: InputDecoration(
                labelText: "Room Number",
                prefixIcon: FaIcon(
                  FontAwesomeIcons.bed,
                  size: 15.0,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _hostelController,
              decoration: InputDecoration(
                labelText: "Hostel",
                prefixIcon: FaIcon(
                  FontAwesomeIcons.home,
                  size: 15.0,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _paymentController,
              decoration: InputDecoration(
                labelText: "Confirmation: Txn ID",
                prefixIcon: FaIcon(
                  FontAwesomeIcons.moneyBill,
                  size: 15.0,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text("Done"),
            onPressed: () {
              print("Pressed");
              String itemName = "";
              String test;
              int l = listLengthC();
              int i = 0;
              print("Hello $l");
              while (i < listLengthC()) {
                test = widget.list[i]['name'];
                itemName += "*$test*, ";
                i++;
              }
              // for (int i; i <= l; i++){
              //   print("Looped $i");
              //   test = widget.list[i]['name'];
              //   // test.replaceAll(' ', '+');
              //   itemName += "$test, ";
              // }
              // String test = widget.list[0]['name'];
              String price = widget.list[0]['price'].toString();
              // http://api.whatsapp.com/send?phone=+263782684837&text=Sadza+and+hoves%2C+x1%2C+Date:07+May+2020%2C+Time:+7:30am

              print(roomNumberController.text + " " + _hostelController.text);
              String room = roomNumberController.text;
              String hostel = _hostelController.text;
              String paid = _paymentController.text;
              print(itemName);
              launch(
                  "http://api.whatsapp.com/send?phone=+263782684837&text=*Get+Supper+Food+Order:*+\nHello,+I+would+like+to+order+*$itemName*+priced+at+a+total+of+\$$_total+\nRoom:+$room+\nHostel:+$hostel+\nOrder+Confirmation:+$paid");
              // launch("http://api.whatsapp.com/send?phone=+263782684837&text=Get+Supper+Food+Order:+$itemName+Room:+$_roomNumber+Hostel:+$_hostel%2C+x1%2C+Date:07+May+2020%2C+Time:+7:30am");
              // FlutterOpenWhatsapp.sendSingleMessage("263782684837",
              //     "*Get Supper Food Order:* \n \n Hello, I would like to order *Sadza and hooves* priced at *\$120.0*. \n Room Number: $_roomNumber \n Hostel: $_hostel\n  This message was generated by the *Get Supper Restuarant Application*.");
              Navigator.pop(context);
            },
          ),
          DialogButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]).show();
  }

  showSnack(BuildContext context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Uidata.primaryColor,
      elevation: 2.0,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.add_shopping_cart),
          Text("Ecocash USSD to be implemented"),
        ],
      ),
      // duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Uidata.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.whatsapp),
            color: Colors.teal,
            onPressed: () {
              returnAlert();
            },
          )
        ],
        backgroundColor: Colors.white,
        title: Text("Cart",
            style: TextStyle(
                color: Uidata.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0)),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: SizedBox(
            height: 70,
            child: Material(
              color: Uidata.accentColor,
              child: Center(
                child: MaterialButton(
                    minWidth: 80.0,
                    height: 40.0,
                    onPressed: () {
                      launchUssd("*151*1*1*0782684837*$_total#");
                      // showSnack(context);
                    },
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.monetization_on),
                          Text("Make Order",
                              style: TextStyle(
                                  color: Uidata.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(getDate(day, month),
                        style: TextStyle(
                            color: Uidata.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ),
                ],
              ),
              Divider(
                color: Uidata.accentColor,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: widget.list.length == 0
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text("You haven't added anything to your cart",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Uidata.accentColor,
                                ),
                                borderRadius: BorderRadius.only(
                                  // bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                )),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  child: Image(
                                    image: AssetImage(
                                        widget.list[index]['picture']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(widget.list[index]['name'],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("\$" +
                                  widget.list[index]['price'].toString()),
                              trailing: ClipRRect(
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(Icons.close,
                                        size: 40.0, color: Colors.red),
                                    onPressed: () {
                                      widget.list.removeAt(index);
                                      setState(() {
                                        listLength = widget.list.length;
                                      });
                                      countTotal();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text("Total:",
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold))),
                    Text("\$$_total",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
