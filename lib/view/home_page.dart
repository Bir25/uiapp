import 'package:appflut/models/book.dart';
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

     Container(
height: 200,
         width: double.infinity,
         child: Image.asset('assets/images/book.jpg', fit:BoxFit.cover ,)
     ),
            SizedBox(height: 20,),

          Container(
              height:200,
            width: double.infinity,
            color: Colors.red,

          child:
           ListView.builder(
             scrollDirection: Axis.horizontal,
              itemCount: books.length,
               itemBuilder: (context, index)
              {
                 final book = books[index];
                return Container(
                  width: 380,
                  padding: EdgeInsets.only(left: index ==0 ? 5:0),
                  child: Row(
                     children: [
                     Container(
                       width:140,
                       height: 210,
                       child: ClipRRect(
                           borderRadius: BorderRadius.circular(20),

                           child: Image.network(book.imageUrl)),
                     ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 210,
                           width: 225,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                               Text(book.title),
                               Text(book.summary, maxLines: 5, overflow: TextOverflow.ellipsis,),
                 SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(book.genre),
                    // Spacer(),
                    Text(book.ratingStar),
                  ],
                 )
                           ],
                         ),
                        ),
                      )
                     ],
                   ),
    );
               }
           ),
          ),

            Padding(
              padding: const EdgeInsets.only(top:15, bottom: 10, left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You may also like', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 3),
              height: 195,
              child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index)
                  {
                    final book = books[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height:160,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),

                                    child: Image.network(book.imageUrl))),
                            Text(book.title),
                            SizedBox(height: 2,),
                            Text(book.genre, style: TextStyle(color: Colors.blue),),
                          ],
                        ),
                            ),
                    );
                  }
              ),
                      ),
      ],
                    ),
              );
  }
}
