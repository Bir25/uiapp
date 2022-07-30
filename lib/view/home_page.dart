import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffF2F5F9),
      appBar: PreferredSize(
          preferredSize:Size (double.infinity, 60),
         child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
         child:AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF2F5F9),
        title: Text('Hi Bir',style: TextStyle(
          color: Colors.red
        )),
        actions: [
          Icon(Icons.search, color: Colors.red, size:25,),
          SizedBox(width: 10,),
          Icon(Icons.notification_important_outlined, color: Colors.red, size:25,),
        ],
      ),
         ),
    ),
        body: Column(
          children: [
Image.network('https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfDB8MHx8&auto=format&fit=crop&w=500&q=60'),
     SizedBox(height: 19,),
     Container(
height: 200,
         width: double.infinity,
         child: Image.asset('assets/images/book.jpg', fit:BoxFit.cover ,)),    ],
        ));
  }
}
