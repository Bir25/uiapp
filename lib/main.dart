import 'package:appflut/provider/counter.dart';
import 'package:appflut/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
void main() {
  runApp(ProviderScope(child: Home()));
}

class Home  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Counter(),
    );
  }
}

class Counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print('build');
     return Scaffold(
        body: SafeArea(
          child: Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final number = ref.watch(counter1Provider);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$number', style: TextStyle(fontSize: 50),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {
                      ref.read(counter1Provider.notifier).state = 90;
                            },
                           child: Text('ADD')),
                          TextButton(onPressed: () {
    ref.read(counterProvider).decrement();

    }, child: Text('SUB')),
                        ],
                      )
                    ],
                  );
                }
              )),
        ));
  }
}
