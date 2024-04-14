import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DetectorScreen extends StatefulWidget{
  const DetectorScreen({super.key});

  @override
  State<DetectorScreen> createState() => DetectorScreenState();

}

class DetectorScreenState extends State<DetectorScreen>{
  File? img;
  bool imageUploaded=false;
  Future _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        img = File(pickedFile.path);
        imageUploaded=true;
      });
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('PlantCare',style: GoogleFonts.montserrat(fontSize:22),),
        elevation: 1,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            
            (imageUploaded==true)? Image.file(img!,scale:4):
            ElevatedButton(onPressed: _pickImage,
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(6),
                fixedSize: MaterialStatePropertyAll(Size(320, 50)),
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(170, 0, 171, 148)),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/icons/gallery.png',scale: 12,color: Colors.white,),
                const SizedBox(width: 12,),
                Text("Upload From Gallery",style: GoogleFonts.lato(fontSize:20,color: Colors.white),),
                const SizedBox(width: 25)
              ],),
              ),


            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){},
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(6),
                fixedSize: MaterialStatePropertyAll(Size(120, 50)),
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(170, 0, 171, 148)),
                foregroundColor: MaterialStatePropertyAll(Colors.white)),
             child: Text("Check",style: GoogleFonts.lato(fontSize:20,color: Colors.white)))
          ],),
      )
    );
  }
}