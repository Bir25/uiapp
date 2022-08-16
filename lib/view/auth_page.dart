import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/login_provider.dart';





class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final isLogin = ref.watch(loginProvider);
        return Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: ListView(
              children: [
                Text(isLogin ? 'Login Form': 'Sign Up Form', style: TextStyle(fontSize: 20),),
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'UserName',
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green)
                  ),
                  child: Center(child: Text('please select an image')),
                  height: 200,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){

                }, child: Text('submit'))
              ],
            ),
          ),
        );
      }
      ));
  }
}
