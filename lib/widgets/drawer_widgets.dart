import 'package:appflut/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer(
        builder: (context, ref, child) {
          final userData = ref.watch(userStream);
          return userData.when(
              data: (data){
              return  ListView(
                  children: [

                  DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(data.imageUrl!))
                      ),
                      child: Text(data.metadata!['email'])),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pop();
                        ref.read(authProvider).userLogOut();
                      },
                      leading: Icon(Icons.exit_to_app),
                      title: Text('LogOut'),
                    )
                  ],
                );
          },
              error:(err, stack)=>Center(child: Text('$err')),
              loading:()=>Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,),));
        }
      ),
    );
  }
}
