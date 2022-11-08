import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled8/controller/home_controller.dart';
import 'package:untitled8/view/home.dart';


void main(){
  runApp(
      MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=>HomeController(),),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}