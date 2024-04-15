import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imag;

class DetectorScreen extends StatefulWidget{
  const DetectorScreen({super.key});

  @override
  State<DetectorScreen> createState() => DetectorScreenState();

}

class DetectorScreenState extends State<DetectorScreen>{
  // Image Picker Variables and Functions
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

  // Model Variables and Fucntions
  Interpreter? _interpreter;

  void loadModel() async {
    _interpreter = await Interpreter.fromAsset('DL model/model.tflite');
  }
 
  //Image preprocessing
 void preprocessImage() async {
  imag.Image? image = imag.decodeImage(img!.readAsBytesSync());
  imag.Image resizedImage = imag.copyResize(image!, width: 64, height: 64);
  var normalizedImage = resizedImage.getBytes().map((pixel) => pixel / 255).toList();
  var input = Float32List.fromList(normalizedImage).reshape([1, 64, 64, 3]);
  var output = Float32List(1).reshape([1, 1]);
  _interpreter!.run(input, output);
  print(output);
}

  // initstate
  @override
  void initState(){
    super.initState();
    loadModel();
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
            ElevatedButton(onPressed: preprocessImage,
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