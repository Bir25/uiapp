import 'package:appflut/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class DetailPage extends StatelessWidget {
final Post post;
DetailPage(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child)
    {
      return ListView(
        children: [  Image.network(post.imageUrl, height: 300, width: double.infinity, fit: BoxFit.fitHeight,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15) ,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title),
                SizedBox(height: 10,),
                Text(post.description),
              ],
            ),
          ),
        ],
      );
    }
    )
    );
  }
}
