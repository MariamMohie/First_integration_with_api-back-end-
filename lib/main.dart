import 'package:flutter/material.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
       CacheHelper().getData(key: ApiKey.id) ==null? SignIn():Home(),
   
    );
  }
}

