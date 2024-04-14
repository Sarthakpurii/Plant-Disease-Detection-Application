import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("   PlantCare",
                style: GoogleFonts.montserrat(
                  fontSize: 26),),
              Text(' Pro',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Color.fromARGB(255, 131, 198, 154)))
            ],),
            const SizedBox(height: 12,),
            Image.asset("assets/icons/leaf.png",scale: 2.2,),
            const SizedBox(height:18),
            Text("Your Plant's Guardian",style: GoogleFonts.lato(fontSize:20),),
            const SizedBox(height:26),
            ElevatedButton(
              onPressed: (){},
              // ignore: sort_child_properties_last
              child: Text("Proceed",style: GoogleFonts.lato(fontSize:17),),
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(6),
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(170, 0, 171, 148)),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
                )
            ]),
      ),

    );
  }
}