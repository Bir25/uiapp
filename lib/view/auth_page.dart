import 'dart:io';

import 'package:appflut/provider/auth_provider.dart';
import 'package:appflut/provider/image_provider.dart';
import 'package:appflut/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';






class AuthPage extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final isLogin = ref.watch(loginProvider);
        final image = ref.watch(imageProvider).image;
        return Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: ListView(
              children: [
                Text(isLogin ? 'Login Form': 'Sign Up Form', style: TextStyle(fontSize: 20),),
                SizedBox(height: 15,),
              if(!isLogin)  TextFormField(
                controller: nameController,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'please provide username';
                    } else if(val.length > 20){
                      return 'maximun character is 19';
                    } else
                    {
                      return null;
                    }

                  },
                  decoration: InputDecoration(
                    hintText: 'username',
                  ),
                ),
                SizedBox(height: 10,),
               TextFormField(
                 controller: mailController,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'please provide valid email';
                    } else if(!val.contains('@')){
                      return 'please provide valid email';
                    } else
                      {
                      return null;
                      }

                  },
                  decoration: InputDecoration(
                    hintText: 'email',
                  ),
                ),
                SizedBox(height: 10,),
               TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'please provide password';
                    } else if(val.length>20){
                      return 'maximum limit is 20';
                    } else
                    {
                      return null;
                    }

                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                ),
                SizedBox(height: 10,),
             if(!isLogin)   InkWell(
               onTap: ()
               {
                 ref.read(imageProvider).imagePick();
               },
               child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green)
                    ),
                    child: image == null ? Center(child: Text('please select an image')):
                  Image.file(File(image.path)),
                    height: 200,
                  ),
             ),
                SizedBox(height: 15,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 45)),
                    onPressed: () async{
                  _form.currentState!.save();
                  if(_form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                      if(isLogin)
                      {
                        final response = await ref.read(authProvider).userLogin(

                            email: mailController.text.trim(),
                            password: passwordController.text.trim(),
                           );
                        if(response != 'success')
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('$response')));

                          }
                      } else
                      {
                 if(image == null){
                     Get.defaultDialog(
                       title:'image required',
                       content: Text('please select an image'),
                       actions: [ TextButton(
                           onPressed: () async{
                             Navigator.of(context).pop();

                       }, child: Text('close'))]
                     );
                 }else {
                   final response = await ref.read(authProvider).userSignUp(
                       username: nameController.text.trim(),
                       email: mailController.text.trim(),
                       password: passwordController.text.trim(),
                       image: image);
                 }
                      }
                    }

                }, child: Text('submit')),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isLogin ? 'Do not have account ?' : 'Already have a Account!'),
                    TextButton(onPressed: (){
                      ref.read(loginProvider.notifier).toggle();
                    }, child: Text(isLogin ? 'Sign Up' : 'Login'))
                  ],
                )

              ],
            ),
          ),
        );
      }
      ));
  }
}
