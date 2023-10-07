
import 'package:flutter/material.dart';
import 'mybagpage.dart';

void main(){
  runApp(const MyBag());
}
class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My Bag",
      debugShowCheckedModeBanner: false,
      home: MyBagPage()
    );
  }
}
