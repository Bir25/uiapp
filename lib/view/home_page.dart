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

          ],
        ));
  }
}
