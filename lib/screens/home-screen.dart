import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("PlantCare Pro"),
          Image.asset("assets/icons/"),
          Text("Your Plant's Guardian"),
          ElevatedButton(onPressed: (){}, child: Text("Next"))]),
      ),

    );
  }
}