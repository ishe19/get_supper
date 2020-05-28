// import 'package:flutter/material.dart';
// import 'package:get_supper/model/db_manager.dart';
// import 'package:get_supper/model/product.dart';
// import 'package:get_supper/ui/utils/uidata.dart';
// import 'package:ussd/ussd.dart';
// import 'package:sqflite/sqflite.dart';

// class Cart extends StatefulWidget {
  
//   List list;
//   Cart({this.list});

//   @override
//   _CartState createState() => _CartState();
// }

// class _CartState extends State<Cart> {

  

// int total;
// List<Product> todoList;
// int count = 0;
// // List<Product> productList = DBManagerViews.getTodoList();


// Future<void> launchUssd(String ussdCode) async {
//     Ussd.runUssd(ussdCode);
//   }

//   String getDate(int day, int month){
//     String todayDate;
//     String todayMonth;
//     if(day == 1){
//       todayDate = "Monday";
//     }else if(day == 2){
//       todayDate = "Tuesday";
//     }else if(day == 3){
//       todayDate = "Wednesday";
//     }else if(day == 4){
//       todayDate = "Thursday";
//     }else if(day == 5){
//       todayDate = "Friday";
//     }else if(day == 6){
//       todayDate = "Saturday";
//     }else if(day == 7){
//       todayDate = "Sunday";
//     }

//     if(month == 1){
//       todayMonth = "January";
//     }else if(month == 2){
//       todayMonth = "February";
//     }else if(month == 3){
//       todayMonth = "March";
//     }else if(month == 4){
//       todayMonth = "April";
//     }else if(month == 5){
//       todayMonth = "May";
//     }else if(month == 6){
//       todayMonth = "June";
//     }else if(month == 7){
//       todayMonth = "July";
//     }else if(month == 8){
//       todayMonth = "August";
//     }else if(month == 9){
//       todayMonth = "September";
//     }else if(month == 10){
//       todayMonth = "October";
//     }else if(month == 11){
//       todayMonth = "November";
//     }else if(month == 12){
//       todayMonth = "December";
//     }

//     return "$todayDate, $day $todayMonth";
//   }
 

//   var product_list = [
//     {
//       "name": "Sadza and hooves",
//       "picture": "assets/sadza1.jpg",
//       "price": 120,
//     },
//     {
//       "name": "Spaghetti",
//       "picture": "assets/spag1.jpg",
//       "price": 80,
//     },
//     {
//       "name": "Macaroni",
//       "picture": "assets/maca1.jpg",
//       "price": 50,
//     },
//     {
//       "name": "Sadza ghoulash",
//       "picture": "assets/sadza2.jpg",
//       "price": 110,
//     },
//     {
//       "name": "Rice and beef",
//       "picture": "assets/rice2.jpg",
//       "price": 90,
//     },
//     {
//       "name": "Roast Beef",
//       "picture": "assets/beef2.jpg",
//       "price": 80,
//     },
//     {
//       "name": "Roast Pork",
//       "picture": "assets/pork2.jpg",
//       "price": 120,
//     },
//     {
//       "name": "Spaghetti Magic",
//       "picture": "assets/spag3.jpg",
//       "price": 80,
//     },
//   ];

//   @override 
//   void initState(){
//     super.initState();
//     // productsPop();
//     updateListView();
//   }

  

//   void updateListView() {
//     // final Future<Database> dbFuture = DBManagerViews.openDB();
//     // dbFuture.then((database) {
//       Future<List<Product>> todoListFuture = DBManagerViews.getTodoList() ;
//       todoListFuture.then((todoList) {
//         setState(() {
//           this.todoList = todoList;
//           this.count = todoList.length;
//         });
//       });
//   // }
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (todoList == null) {
//       todoList = List<Product>();
//       updateListView();
//     }

//      void _delete(BuildContext context, int index) async {
//     // int result = await databaseHelper.deleteTodo(todo.id);
//     int result = await DBManagerViews.deleteOrder(index);
//     if (result != 0) {
//       // _showSnackBar(context, 'Todo Deleted Successfully');
//       updateListView();
//     }
//   }

//   getFirstLetter(String title) {
//     return title.substring(0, 2);
//   }

//   //  void navigateToDetail(Todo todo, String title) async {
//   //   bool result =
//   //       await Navigator.push(context, MaterialPageRoute(builder: (context) {
//   //     return TodoDetail(todo, title);
//   //   }));

  

//   ListView getTodoListView() {
//     return ListView.builder(
//       itemCount: count,
//       itemBuilder: (BuildContext context, int position) {
//         return Card(
//           color: Colors.white,
//           elevation: 2.0,
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.amber,
//               child: Text(getFirstLetter(this.todoList[position].title),
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             title: Text(this.todoList[position].title,
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text(this.todoList[position].price),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 GestureDetector(
//                   child: Icon(Icons.delete,color: Colors.red,),
//                   onTap: () {
//                     _delete(context, todoList[position].id);
//                   },
//                 ),
//               ],
//             ),
//             onTap: () {
//               debugPrint("ListTile Tapped");
//               // navigateToDetail(this.todoList[position], 'Edit Todo');
//             },
//           ),
//         );
//       },
//     );
//   }



//   var day = DateTime.now().weekday;
//   var month = DateTime.now().month;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1.0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Uidata.primaryColor,
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         title: Text("Cart", style: TextStyle(color: Uidata.primaryColor, fontWeight: FontWeight.bold, fontSize: 24.0)),
        
//         ),
//         bottomNavigationBar: ClipRRect(
//           borderRadius:  BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0)
//                 ),
                
//                   child: SizedBox(
//             height: 70,
//             child: Material(
//               color: Uidata.accentColor,
//               child: Center(
//                   child: MaterialButton(
//                     minWidth: 80.0,
//                     height: 40.0,
//                     onPressed: (){
//                       //TODO Ecocash method here....
//                       launchUssd("*151*4#");
//                     },
//                     color: Colors.yellow,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(30.0)
//                       ),
                      
//                     ),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.7,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           Icon(Icons.monetization_on),
//                           Text("Make Order", style: TextStyle(color: Uidata.primaryColor, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     )
//                   ),
//                 ),
//             )
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20.0),
//                     child: Text(getDate(day, month), style: TextStyle(color: Uidata.primaryColor, fontWeight: FontWeight.bold, fontSize: 25.0)),
//                   ),
                  
//                 ],
//               ),
//               Divider(
//                     color: Uidata.accentColor,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.632,
//                     child: getTodoListView(),
//                   )
//             ],
//           ),
//         ),
//     );
//   }
//   Widget cartTile(String img, String title, String price, int index){
//     return Card(
//           child: ListTile(
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//             child: Image(
//               image: AssetImage(img),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         title: Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//         subtitle: Text("\$$price"),
//         trailing: ClipRRect(
//                 child: Container(
//             child: IconButton(
//               icon: Icon(Icons.close),
//               onPressed: (){
                
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  

 

  

//   Widget listCart() {
//     return FutureBuilder(
//                       future: DBManagerViews.getList(),
//                       builder: (context, snapshot){
//                         if(snapshot.connectionState == ConnectionState.done){
//                           final cart = snapshot.data;
//                           return ListView.builder(
//                             itemCount: cart == null ? Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 CircularProgressIndicator(),
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Text("It seems you haven't placed anything in your cart"),                              )
//                               ],
//                             )
//                             : cart.length,
//                             itemBuilder: (context, index){
//                               return Card(
//           child: ListTile(
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//             child: Image(
//               image: AssetImage(cart[index]['img']),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         title: Text(cart[index]['title'], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//         subtitle: Text("\$" + cart[index]['price']),
//         trailing: ClipRRect(
//                 child: Container(
//             child: IconButton(
//               icon: Icon(Icons.close),
//               onPressed: (){
//                 // refreshList(index);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//                             },
//                           );
//                         }
//                       }
//                     );
//   }



// }}