import 'package:appflut/provider/auth_provider.dart';
import 'package:appflut/provider/crud_provider.dart';
import 'package:appflut/widgets/drawer_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





class HomePage extends StatelessWidget {

  final uid = FirebaseAuth.instance.currentUser!.uid;

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

               Container(
                 child: posts.when(
                     data:(data) {
                       return ListView.builder(
                         shrinkWrap: true,
                       itemCount: data.length,
                       itemBuilder: (context, index){
                         return Image.network(data[index].imageUrl);
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
