import 'package:appflut/view/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Home());
}

class Home  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
