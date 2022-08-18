


import 'dart:async';

import 'package:appflut/view/auth_page.dart';
import 'package:appflut/view/status_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusPage(),
    );
  }
}

class CounterApp extends StatelessWidget {
  int number = 0;
  final numberController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: StreamBuilder<int>(
          stream: numberController.stream,
          builder: (context, snapshot) {
            if(snapshot.hasData)
              {
                return Text('${snapshot.data}', style: TextStyle(fontSize: 50),);
              }else
                {
                  return Text('${snapshot.data}', style: TextStyle(fontSize: 50),);
                }
          }
        )
        ),
         floatingActionButton: FloatingActionButton(
           onPressed: () {
             numberController.sink.add(number++);
           },
         child: Icon(Icons.add),
         ),
    );
  }
}
