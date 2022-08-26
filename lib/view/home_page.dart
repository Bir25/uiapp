import 'package:appflut/provider/auth_provider.dart';
import 'package:appflut/provider/crud_provider.dart';
import 'package:appflut/view/detail_page.dart';
import 'package:appflut/view/edit_page.dart';
import 'package:appflut/widgets/drawer_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;





class HomePage extends StatelessWidget {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  late types.User currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Social App'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final users = ref.watch(usersStream);
            final posts = ref.watch(postStream);
            return Column(
              children: [
                Container(
                  height: 149,
                  child: users.when(
                      data: (data) {
                        currentUser = data.firstWhere((element) => element.id == uid, orElse:(){
                          return types.User(
                            id: 'no data'
                          );
                        } );
                        final dat = data.where((element) => element.id != uid).toList();
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dat.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:NetworkImage(dat[index].imageUrl!) ,
                                  ),
                                  SizedBox(height: 10,),
                                  Text(dat[index].firstName!, style: TextStyle(fontSize:17),)
                                ],
                              ),
                            );
                          },
                        );
                      },
                      error: (err, stack) => Text('$err'),
                      loading: () => Container(),
                ),
                ),
         SizedBox(height: 10,),
               Container(
                 height: 500,
                 padding: EdgeInsets.symmetric(horizontal: 10) ,
                 child: posts.when(
                     data:(data) {
                       return ListView.builder(
                            physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                       itemCount: data.length,
                       itemBuilder: (context, index){
                         return Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Expanded(child: Text(data[index].title,
                                     overflow: TextOverflow.ellipsis, maxLines: 2,)),
                                    if(uid == data[index].userId ) IconButton(onPressed: (){
                                      Get.defaultDialog(
                                        title: 'edit page',
                                        content: Text('customize you post'),
                                        actions: [
                                          IconButton(onPressed: (){
                                            Navigator.of(context).pop();
                                            Get.to(() => EditPage(data[index]), transition: Transition.leftToRight);
                                          }, icon: Icon(Icons.edit)),
                                          IconButton(onPressed: (){
                                            Navigator.of(context).pop();
                                            Get.defaultDialog(
                                              title: 'Are you Sure',
                                              content: Text('remove the post') ,
                                              actions: [
                                                TextButton(onPressed: (){
                                                  Navigator.of(context).pop();
                                                  ref.read(crudProvider).removePost(
                                                      postId: data[index].id,
                                                      imageName: data[index].imageName);
                                                }, child: Text('Yes')),
                                                TextButton(onPressed: (){
                                                  Navigator.of(context).pop();
                                                }, child: Text('No'))
                                              ]
                                            );
                                          }, icon: Icon(Icons.delete)),
                                        ]
                                      );
                                    }, icon: Icon(Icons.edit) )
                                   ],
                                 ),
                                 if(uid != data[index].userId )   SizedBox(height: 10,),
                                 InkWell(
                                   onTap: (){
                                     Get.to(() => DetailPage(data[index]), transition: Transition.leftToRight);
                         },
                                   child: CachedNetworkImage(
                                    imageUrl: data[index].imageUrl,
                                     height: 250,
                                     width: 300,
                                     fit: BoxFit.fitHeight,),
                                 ),
                                 SizedBox(height: 10,),
                                 Container(
                                   width: double.infinity,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text(data[index].description, overflow: TextOverflow.ellipsis, maxLines: 2,),
                                      if(data[index] != uid)   Row(
                                        children: [
                                          IconButton(onPressed: (){
                                            if(data[index].like.usernames.contains(currentUser.firstName)){
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  duration: Duration(seconds:1 ),
                                                  content:Text('you have already like the post') ));
                                            }else
                                              {
                                                ref.read(crudProvider).addLike(
                                                    like: data[index].like.likes,
                                                    username: currentUser.firstName!,
                                                    postId: data[index].id);
                                              }

                                             }, icon: Icon(Icons.thumb_up_alt_outlined)),
                                          if(data[index].like.likes !=0) Text('${data[index].like.likes}')
                                        ],
                                      )
                                       ],
                                     ))
                                 
                               ],
                             ));
            });
            },
                     error: (err, stack) => Center(child: Text('$err')),
                     loading: () => Center(child: CircularProgressIndicator(
            color: Colors.lightGreen,
            ))
            ),
               ),
              ],
            );
          }),
    drawer: DrawerWidgets(),);
  }
}
