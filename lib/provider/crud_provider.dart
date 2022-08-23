
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class CrudProvider{
  final postDb = FirebaseFirestore.instance.collection('posts');
  Future<String> postAdd({required String title, required String description, required String userId, required XFile image})async{
    try{
      final ref = FirebaseStorage.instance.ref().child(
          'postImage/${image.name}');
      await ref.putFile(File(image.path));
      final imageUrl = await ref.getDownloadURL();
final response = await postDb.add({
 'title':title,
 'description':description,
 'imageUrl':imageUrl,
 'userId':userId,
  'imageName':image.name,
 'Comments':[],
 'like':{
   'likes':0,
   'usernames':[]
 },
  
});
return 'success';
    }on FirebaseException catch(err){
print(err);
return '${err.code}';
    }
  }


  Future<String> updatePost({required String title, required String description, required String postId, XFile ? image})async{
    try{
      final ref = FirebaseStorage.instance.ref().child(
          'postImage/${image.name}');
      await ref.putFile(File(image.path));
      final imageUrl = await ref.getDownloadURL();
      final response = await postDb.add({
        'title':title,
        'description':description,
        'imageUrl':imageUrl,
        'userId':userId,
        'imageName':image.name,
        'Comments':[],
        'like':{
          'likes':0,
          'usernames':[]
        },

      });
      return 'success';
    }on FirebaseException catch(err){
      print(err);
      return '${err.code}';
    }
  }
}