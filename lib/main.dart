import 'package:flutter/material.dart';
import 'package:sarthi/app/global/appcolor.dart';
import 'package:sarthi/app/ui/login_ui.dart';

import 'app/home/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sarthi',debugShowCheckedModeBanner: false,color: appcolor.blue,
      home: LoginUi(),
    );

  }
}
